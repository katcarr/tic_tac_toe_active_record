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

    if self.win?
      return true
    else
      self.turner()

      return false
    end
  end

  def win?
    possible_wins = []
    possible_wins.push(Space.where({x_coordinate: 1}))
    possible_wins.push(Space.where({x_coordinate: 2}))
    possible_wins.push(Space.where({x_coordinate: 3}))
    possible_wins.push(Space.where({y_coordinate: 1}))
    possible_wins.push(Space.where({y_coordinate: 2}))
    possible_wins.push(Space.where({y_coordinate: 3}))
    ne_diaganol = []
    ne_diaganol.push(Space.where(x_coordinate: 1 , y_coordinate: 1).first)
    ne_diaganol.push(Space.where(x_coordinate: 2 , y_coordinate: 2).first)
    ne_diaganol.push(Space.where(x_coordinate: 3 , y_coordinate: 3).first)
    possible_wins.push(ne_diaganol)
    nw_diaganol = []
    nw_diaganol.push(Space.where(x_coordinate: 1 , y_coordinate: 3).first)
    nw_diaganol.push(Space.where(x_coordinate: 2 , y_coordinate: 2).first)
    nw_diaganol.push(Space.where(x_coordinate: 3 , y_coordinate: 1).first)
    possible_wins.push(nw_diaganol)

    possible_wins.each do |space_collection|
      if space_collection[0].player_id && space_collection[1].player_id  && space_collection[2].player_id

        if space_collection[0].player.mark == space_collection[1].player.mark && space_collection[0].player.mark == space_collection[2].player.mark
          return true
        end
      end
    end

    false

  end

end
