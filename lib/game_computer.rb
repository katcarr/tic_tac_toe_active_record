class ComputerGame < Game

  def computerplay
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

    o_marks = 0
    computer = Player.where(mark: "O").first
    possible_wins.each do |possible_win|
      3.times do |i|
        if possible_win[i].player_id
          if possible_win[i].player.mark = "O"
            o_marks +=1
          end
        end
        if o_marks == 2
          3.times do |i|
            if possible_win[i].player_id == nil
                space = possible_win[i]
                space.update(player_id: computer.id)
                return
            end
          end
        else
          easy_computerplay
        end
      end
    end


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
