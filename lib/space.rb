class Space<ActiveRecord::Base
  belongs_to(:player)
  belongs_to(:board)

  define_method(:markby) do |player|
   self.player_id = player.id
  end

end
