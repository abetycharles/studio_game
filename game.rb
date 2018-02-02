require_relative 'player'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  def initialize(title)
    @title = title.capitalize
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def print_treasures
    treasures = TreasureTrove::TREASURES
    puts "There are #{treasures.size} treasures to be found:"
    treasures.each do |treasure|
      print_treasure(treasure)
    end
  end

  def print_treasure(treasure)
    puts "A #{treasure.name} is worth #{treasure.points} points"
  end

  def find_treasure(player)
    treasures = TreasureTrove::TREASURES
    treasure = treasures.sample
    puts "#{player.name} found a #{treasure.name} worth #{treasure.points} points."
  end

  def play(rounds)
    puts "There are #{@players.size} in #{@title}:"
    @players.each do |player|
      puts player
    end

    puts("\n")
    print_treasures

    1.upto(rounds) do |round|
      puts "\n\nRound #{round}: \n"
      @players.each do |player|
        GameTurn.take_turn(player)
        find_treasure(player)
      end
    end
  end

  def print_stats
    puts "\n#{@title} Statistics:"
    puts("\n")

    strong, wimpy = @players.partition { |player| player.strong?}

    puts "#{strong.size} strong players:"
    print_player_summary(strong)

    puts "\n#{wimpy.size} wimpy players:"
    print_player_summary(wimpy)
  end

  def print_player_summary(players)
    players.each do |player|
      print_name_and_health(player)
    end
  end

  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end

  def print_scores
    puts "\n#{@title} High Scores:"
    @players.sort.each do |player|
      print_formatted_name_and_score(player)
    end
  end

  def print_formatted_name_and_score(player)
    puts "#{player.name.ljust(20, '.')} #{player.score}"
  end
end


if __FILE__ == $0
  player1 = Player.new('moe')
  player2 = Player.new('larry', 60)
  player3 = Player.new('curly', 125)

  knuckleheads = Game.new("Knuckleheads")

  knuckleheads.add_player(player1)
  knuckleheads.add_player(player2)
  knuckleheads.add_player(player3)

  knuckleheads.play(3)
end