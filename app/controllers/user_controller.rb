class UserController < ApplicationController

get "/signup" do
    erb :"users/new"
end

post "/signup" do
    u = User.new(params) 
    if u.email.blank? || u.password.blank? || User.find_by_email(params[":email"])   
        redirect to '/signup'
    else 
        u.save
        session[:user_id] = u.id #assign id and add key value pairs to the session hash
        redirect '/items'
    end 
end

get '/users/:id' do
    erb :"users/show"
end

end