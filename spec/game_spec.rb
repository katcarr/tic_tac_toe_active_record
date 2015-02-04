require 'spec_helper'

describe Game do
  it {should have_many(:players)}
  it { should have_one(:board)}

  it("should create a X player and O player when initialized") do
    test_game = Game.create()
    expect(test_game.players.first.mark).to(eq("X"))
  end

  it("should create a board when initialized") do
    test_game = Game.create()
    expect(test_game.board).to(be_an_instance_of(Board))
  end

  describe 'win?' do
    it("returns true if there are three Xs or Os in a row") do
      test_game = Game.create
      test_game.play(1, 3)
      test_game.reload()
      test_game.play(2, 1)
      test_game.reload()
      test_game.play(1, 1)
      test_game.reload()
      test_game.play(3, 3)
      test_game.reload()
      expect(test_game.play(1, 2)).to eq(true)
    end

    it("returns false if there is no win") do
      test_game = Game.create
      expect(test_game.play(1, 2)).to eq(false)
    end
  end

  describe '#play' do
    it("marks the appropriate space with the players turn") do
      game = Game.create()
      game.play(1, 2)
      this_space = game.board.spaces.find_by({x_coordinate: 1, y_coordinate: 2})
      expect(this_space.player.mark).to eq("X")
    end
  end

  describe '#turner' do
    it("alternates between X and O's turn, X is always first") do
     test_game = Game.create()
     expect(test_game.turn).to(eq('X'))
    end

    it("alternates between X and O's turn, X is always first") do
     test_game = Game.create()
     test_game.turner()
     expect(test_game.turn).to(eq("O"))
    end
  end
end
