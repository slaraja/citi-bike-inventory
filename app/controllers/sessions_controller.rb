class SessionsController < ApplicationController

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
    
end
