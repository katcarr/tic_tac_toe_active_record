class Game <ActiveRecord::Base
  has_many(:players)
  has_one(:board)

  after_create do

    self.players.push(Player.create(mark: 'X'))
    self.players.push(Player.create(mark: 'O'))

    board = self.create_board(game_id: self.id)
    self.update(board_id: board.id)
    self.update(turn: "X")

  end

  def turner
    if self.turn == "X"
      self.update(turn: "O")
    else
      self.update(turn: "X")
    end
  end

  define_method(:play) do |x , y|

    if self.turn == "X"
      player = Player.where({mark: "X"}).first
    else
      player = Player.where({mark: "O"}).first
    end

    Space.where({x_coordinate: x, y_coordinate: y}).first.markby(player)

    self.turner()

  end


end
