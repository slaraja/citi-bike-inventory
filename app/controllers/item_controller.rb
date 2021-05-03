class ItemController < ApplicationController
    
    get '/items' do
        redirect_to_signup_if_not_logged_in
        @items = Item.all
        erb :"items/index" 
    end

    get '/items/new' do
        redirect_to_signup_if_not_logged_in            
        erb :"items/new"
    end

     get '/items/:id' do
        redirect_to_signup_if_not_logged_in
        @item = Item.find(params["id"])
        if current_user.id == @item.user_id  
            erb :"items/show"
        else
            redirect '/items'
        end
    end

    post '/items' do
        item = Item.new(params)
        #assigns the item to the user
        item.user_id= session[:user_id]
        item.save
        redirect '/items'
    end


    get '/items/:id/edit' do
        redirect_to_signup_if_not_logged_in
        #the user told us which obj they are looking for, so we have to find it
        @item = Item.find(params["id"])
        if current_user.id == @item.user_id  
            # then user can see this form
            erb :"items/edit"
        else
            redirect '/items'
        end
    end

    patch '/items/:id' do
        @item = Item.find(params["id"])
        @item.update(params["item"])
        redirect "/items/#{@item.id}"
    end

    delete '/items/:id' do
        @item = Item.find(params["id"])
        @item.destroy
        redirect '/items'
    end

end