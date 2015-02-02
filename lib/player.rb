class Player < ActiveRecord::Base
  has_many(:spaces)
end
