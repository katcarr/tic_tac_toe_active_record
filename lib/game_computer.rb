class ComputerGame < Game
  def computerplay
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
