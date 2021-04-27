require './config/environment'

class ApplicationController < Sinatra::Base
  #gets info from Sinatra on how to make a req and handle controls

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'notreallyasecret'
    #servers secret code to make sure session has not been tampered with
    #session is an object hash
  end

  get "/" do
    "Hello"
  end

   #show the form
   get '/login' do
    erb :"users/login" 
end

#process the form
post '/login' do
    #check to see if user exists in DB, finds first user in DB with the email
    user = User.find_by_email(params[:email])  
    #confirm if password is correct
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        #set a key in the session hash equal to this user id
        redirect '/items'
    else
        redirect '/login'
    end 
end

get '/logout' do
    session.clear
    redirect '/signup'
end

  #use this instead of folder because you don't have access to the session in folder
  #easier to call
  helpers do #allows views to access these methods

    def logged_in?
      !!current_user #ret true or false if user is logged in
      #boolean value !! allows for it to ret true/false
    end
    
    def current_user   #memoization
      #why not just user = there might be a user who isn't a a current user
      @current_user ||= User.find(session[:user_id]) if session[:user_id] 
      #if someone hasn't logged in, it doesn't try to look it up (if session[user_id])
    end

  end

  

end
