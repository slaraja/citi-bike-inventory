require './config/environment'

class ApplicationController < Sinatra::Base
  #gets info from Sinatra on how to make a req and handle controls

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'notreallyasecret'
    #servers secret code to make sure session has not been tampered with
  end

  get "/" do
    "Hello"
  end

end
