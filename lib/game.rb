class Game <ActiveRecord::Base
  has_many(:players)
  has_one(:board)

  after_initialize do

    self.players.push(Player.create(mark: 'X'))
    self.players.push(Player.create(mark: 'O'))

    board = Board.create()

    self.update({board_id: board.id })

    self.turn = "X"

  end

  def turner
    if self.turn == "X"
      self.turn = "O"
    else
      self.turn = "X"
    end
  end

  define_method(:play) do |x , y|

    if turn == "X"
      player = self.players[0]
    else
      player = self.players[1]
    end
# binding.pry()
    Space.where({x_coordinate: x, y_coordinate: y}).first.markby(player)
# binding.pry()

    self.turner()

  end

  # def win?
  #   if
  #
  #
  #
  # end

end
