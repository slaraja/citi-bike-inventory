class UserController < ApplicationController

get "/signup" do
    erb :"users/new"
end

post "/signup" do
    #handles signing up the user
    #binding.pry
    #instantiate user
    u = User.new(params)
    #params is key value pairs. 
    #instead of params could also write: User.new(email: params["email"], password: params["password"])
    #make sure user signed up with valid data
    if u.email.blank? || u.password.blank? || User.find_by_email(params[":email"])   
    #checks to see if all values are filled in and if the email is already used
    redirect to '/signup'
    else #a valid attempt
        u.save
        session[:user_id] = u.id #IMPORTANT: assign id and add key value pairs to the session hash
        redirect '/items'
    end 
end

end