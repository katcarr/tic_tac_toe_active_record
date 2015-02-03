class Space<ActiveRecord::Base
  belongs_to(:player)
  belongs_to(:board)

  define_method(:markby) do |player_to_connect|
    self.player = player_to_connect
    self.save()
  end

end
