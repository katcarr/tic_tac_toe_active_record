class Board<ActiveRecord::Base
  has_many(:spaces)
  belongs_to(:game)

  after_create do

    3.times do |x|
      3.times do |y|
        self.spaces.push(Space.create({x_coordinate: x+1 , y_coordinate: y+1}))
      end
    end

  end
end
