class Player < ActiveRecord::Base
  has_many(:spaces)
  belongs_to(:game)
end
