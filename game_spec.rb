require_relative 'game'

describe Game do
  before do
    $stdout = StringIO.new

    @game = Game.new('knockleheads')

    @initial_health = 120
    @player = Player.new('larry', @initial_health)

    @game.add_player(@player)
  end

  context "when high number is rolled" do
    before do
      @rounds = 2
      allow_any_instance_of(Die).to receive(:roll).and_return(5)
      @game.play(@rounds)
    end

    it "it's health value increases by 15 per play" do
      expect(@player.health).to eq @initial_health + (15 * @rounds)
    end
  end

  context "when middle number is rolled" do
    before do
      @rounds = 2
      allow_any_instance_of(Die).to receive(:roll).and_return(3)
      @game.play(@rounds)
    end

    it "it's health value stays the same per play" do
      expect(@player.health).to eq @initial_health
    end
  end

  context "when a low number is rolled" do
    before do
      @rounds = 2
      allow_any_instance_of(Die).to receive(:roll).and_return(1)
      @game.play(@rounds)
    end

    it "its health value increases by 10 per play" do
      expect(@player.health).to eq @initial_health - (10 * @rounds)
    end
  end
end