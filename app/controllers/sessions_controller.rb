class SessionsController < ApplicationController

    get '/login' do
        erb :"users/login" 
    end

    post '/login' do
        user = User.find_by_email(params[:email])  
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
    
end
