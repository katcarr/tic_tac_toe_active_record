require 'bundler/setup'
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get '/' do
  @games = Game.all()

  if @games.count == 0
    @game = Game.create()
  else
    @game = @games.first()
  end

  erb(:index)
end

post '/play' do
  space = Space.find(params.fetch("space_id").to_i)
  game = Game.all().first
  game.play(space.x_coordinate, space.y_coordinate)
  redirect '/'
end
