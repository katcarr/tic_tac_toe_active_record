require 'bundler/setup'
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
erb(:index)
end

get '/game' do

  if ComputerGame.all().first
    @game = ComputerGame.all().first
  else
     @game = Game.all().first
  end

  erb(:game)
end

post '/computer_play' do
  ComputerGame.create()
  redirect '/game'
end

post '/two_player' do
  Game.create()
  redirect '/game'
end

post '/play' do
  space = Space.find(params.fetch("space_id").to_i)
  if ComputerGame.all().first
    game = ComputerGame.all().first

    if game.play(space.x_coordinate, space.y_coordinate) == false
      game.computerplay()
    end
  else
    game = Game.all().first
    if game.win? == false
      game.play(space.x_coordinate, space.y_coordinate)
    end
  end
  redirect '/game'
end


post '/clear' do
  Game.all().each do |game|
    game.destroy()
  end
  Board.all() do |board|
    board.destroy
  end
  Space.all().each do |space|
    space.destroy()
  end
  Player.all().each do |player|
    player.destroy()
  end
  redirect '/'
end
