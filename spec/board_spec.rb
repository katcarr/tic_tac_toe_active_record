require 'spec_helper'

describe Board do
  it { should have_many(:spaces) }

  it ("creates nine spaces after the board is initialized") do
    board = Board.create()
    expect(board.spaces.first.x_coordinate).to eq(1)
  end

  it ("creates nine spaces after the board is initialized") do
    board = Board.create()
    expect(board.spaces[5].y_coordinate).to eq(3)
  end

end
