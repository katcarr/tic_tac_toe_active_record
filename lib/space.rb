class Space<ActiveRecord::Base
  belongs_to(:player)

  define_method(:markby) do |player|
   self.player_id = player.id
  end

end
