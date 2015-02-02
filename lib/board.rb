class Board<ActiveRecord::Base
  has_many(:spaces)
  
  after_initialize do

    3.times do |x|
      3.times do |y|
        self.spaces.push(Space.create({x_coordinate: x+1 , y_coordinate: y+1}))
      end
    end

  end
end
