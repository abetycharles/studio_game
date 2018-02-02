class Player
  attr_accessor :name
  attr_reader :health

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end

  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."
  end

  def score
    @health + @name.length
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end

  def strong?
    @health > 100 ? true : false
  end

  def status
    strong? ? "Strong" : "Wimpy"
  end

  def <=> (other)
    other.score <=> score
  end
end


if __FILE__ == $0
  player2 = Player.new("lawrence", 60)
  puts player2.name
  player2.name = "Lawrence"
  puts player2.name
  puts player2.health
  puts player2.score
  puts player2
end