require './config/environment'

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'notreallyasecret'
    set :show_exceptions, false
  end

  not_found do 
    status 404 
    redirect to '/signup'
  end

  error ActiveRecord::RecordNotFound do
    redirect to '/signup'
  end

  helpers do 

    def logged_in?
      !!current_user
      #!! converts to boolean
    end
    
    def current_user  
      @current_user ||= User.find(session[:user_id]) if session[:user_id] 
    end
  end

    def redirect_to_signup_if_not_logged_in
      if !logged_in?
        redirect '/signup' 
      end
    end 

end 

