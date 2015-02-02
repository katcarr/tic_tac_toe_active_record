ENV['RAV_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }


RSpec.configure do |config|
  config.after(:each) do
    Board.all().each { |board| board.destroy }
    #
    # Game.all().each { |game| game.destroy }

    Player.all.each { |player| player.destroy }

    Space.all.each { |space| space.destroy }

  end
end
