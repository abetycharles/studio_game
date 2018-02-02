require_relative 'player'

describe Player do

  before do
    $stdout = StringIO.new
    @initial_health = 90
    @player = Player.new('larry', @initial_health)
  end

  it "has a capitalized name" do
    expect(@player.name).to eq 'Larry'
  end

  it "has an initial health value" do
    expect(@player.health).to eq 90
  end

  it "has a string representation" do
    @player = Player.new('larry', 90)

    expect(@player.to_s).to eq "I'm Larry with a health of 90 and a score of 95."
  end

  it "increases health value by 15 when w00ted" do
    @player.w00t

    expect(@player.health).to eq @initial_health + 15
  end

  it "decreases health value by 10 when blamed" do
    @player.blam

    expect(@player.health).to eq @initial_health - 10
  end

  it "computes a score as the sum of its health and length of name" do
    expect(@player.score).to eq 95
  end

  context "has a default health value" do
    before do
      @player = Player.new('larry')
    end
    it "when created without health value" do
      expect(@player.health).to eq 100
    end
  end

  context "has health value greater than 100" do
    before do
      initial_health = 101
      @player = Player.new('larry', initial_health)
    end

    it "is strong" do
      expect(@player).to be_strong
    end

    it "has a health status of strong" do
      expect(@player.status).to eq 'Strong'
    end
  end

  context "has health value less than or equal to 100" do
    before do
      initial_health = 100
      @player = Player.new('larry', initial_health)
    end

    it "is wimpy" do
      expect(@player).not_to be_strong
    end

    it "has a health status of wimpy" do
      expect(@player.status).to eq "Wimpy"
    end
  end

  context "in a collection of players" do
    before do
      @player1 = Player.new('moe', 100)
      @player2 = Player.new('larry', 200)
      @player3 = Player.new('curly', 300)

      @players = [@player1, @player2, @player3]
    end

    it "is sorted by decreasing score" do
      expect(@players.sort).to eq [@player3, @player2, @player1]
    end
  end
end