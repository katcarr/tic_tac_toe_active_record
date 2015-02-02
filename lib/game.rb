class Game <ActiveRecord::Base
  has_many(:players)

  after_initialize do

    self.players.push(Player.create(mark: 'X'))
    self.players.push(Player.create(mark: 'O'))

    board = Board.create()

    self.update({board_id: board.id })

  end

end
