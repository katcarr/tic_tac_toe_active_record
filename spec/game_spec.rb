require 'spec_helper'

describe Game do
  it {should have_many(:players)}

  it("should create a X player and O player") do
    test_game = Game.create()
    expect(test_game.players.first.mark).to(eq("X"))
  end

end
