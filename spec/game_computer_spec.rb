require 'spec_helper'

describe ComputerGame do

  describe('#computerplay') do
    it("chooses two random coordinates that have not been played and it marks them") do
      computer_game = ComputerGame.create()
      computer_game.play(2, 2)
      computer_game.play(2,3)
      computer = computer_game.players.where(mark: "O").first
      computer_game.computerplay()
      expect(computer.spaces.first).to(be_an_instance_of(Space))
    end
  end
end
