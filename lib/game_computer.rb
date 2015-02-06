class ComputerGame < Game

  def computerplay

    if possible_win("O")
      return
    elsif possible_win("X")
      return
    else
      easy_computerplay
    end


  end

  define_method(:possible_win) do |mark|

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

    marks = 0
    possible_wins.each do |possible_win|
      3.times do |i|
        if possible_win[i].player_id
          if possible_win[i].player.mark == mark
            marks +=1
          end
        end
      end

      if marks == 2
          3.times do |i|
            if possible_win[i].player_id == nil
                space = possible_win[i]
                self.play(space.x_coordinate, space.y_coordinate)
                return true
            end
          end
      end

      marks = 0
    end

    false

  end








  def easy_computerplay
      random_num = Random.new

      played = false

      while !played

        x = random_num.rand(1..3)
        y = random_num.rand(1..3)

        if self.board.spaces.where(x_coordinate: x , y_coordinate: y).first.player_id == nil
          play(x,y)
          played = true
        end

      end

  end
end
