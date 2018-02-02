require_relative 'die'
require_relative 'player'

module GameTurn
  def self.take_turn(player)
    die = Die.new
    number_rolled = die.roll
    case number_rolled
      when 5..6
        player.w00t
      when 3..4
        puts "#{player.name} was skipped."
      else
        player.blam
    end
  end
end