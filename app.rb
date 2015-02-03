require 'bundler/setup'
Bundler.require(:default)


get '/' do

  erb(:index)
end

post '/top_left' do

  redirect '/'
end
