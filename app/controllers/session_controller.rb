class SessionController < ApplicationController

    #show the form
    get '/login' do
        erb :"users/login" 
        #erb is the comman we use to show the form
    end

    #process the form
    post '/login' do
        binding.pry
    end
    
    
    get '/logout' do
        session.clear
        redirect '/signup'
    end
    
end
