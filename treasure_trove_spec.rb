require_relative 'treasure_trove'

describe Treasure do
  before do
    @treasure = Treasure.new(:pie, 5)
  end

  it "has a name attribute" do
    expect(@treasure.name).to eq :pie
  end

  it "has a points attribute" do
    expect(@treasure.points).to eq 5
  end
end

describe TreasureTrove do
  before do
    @treasures = TreasureTrove::TREASURES
  end
  it "has six treasures" do
    expect(@treasures.size).to eq 6
  end

  it "has pie worth 5 points" do
    expect(@treasures[0]).to eq Treasure.new(:pie, 5)
  end
  it "has bottle worth 25 points" do
    expect(@treasures[1]).to eq Treasure.new(:bottle, 25)
  end
  it "has hammer worth 50 points" do
    expect(@treasures[2]).to eq Treasure.new(:hammer, 50)
  end
  it "has skillet worth 100 points" do
    expect(@treasures[3]).to eq Treasure.new(:skillet, 100)
  end
  it "has broomstick worth 200 points" do
    expect(@treasures[4]).to eq Treasure.new(:broomstick, 200)
  end
  it "has crowbar worth 400 points" do
    expect(@treasures[5]).to eq Treasure.new(:crowbar, 400)
  end

  it "returns a random treasure when random is called" do
    treasure = TreasureTrove.random

    expect(@treasures).to include(treasure)
  end
end