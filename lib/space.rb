class Space<ActiveRecord::Base
  belongs_to(:player)
  belongs_to(:board)

  define_method(:markby) do |player_to_connect|
    self.update(player_id: player_to_connect.id)
  end

end
