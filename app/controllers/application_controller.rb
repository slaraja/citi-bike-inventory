require './config/environment'

class ApplicationController < Sinatra::Base
  #gets info from Sinatra on how to make a req and handle controls

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    "Hello"
  end

  get '/signup' do
    erb :"users/new"
end

  #Variable is reset every time we make a request because it's a new instance.


end
