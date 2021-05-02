class ItemController < ApplicationController
    
    get '/items' do
        @items = Item.all
        erb :"items/index" 
    end

    #displays create new item form
    get '/items/new' do
        redirect_to_signup_if_not_logged_in            
        erb :"items/new"
    end

    #displays one item based on the id in the url
     get '/items/:id' do
        redirect_to_signup_if_not_logged_in
        @item = Item.find(params["id"])
        # erb :"items/show"
        if current_user.id == @item.user_id  
            # then user can see the info
            erb :"items/show"
        else
            redirect '/items'
        end
    end

    #creates one item
    post '/items' do
        item = Item.new(params)
        #assigns the item to the user
        item.user_id= session[:user_id]
        #need to save to add to database
        item.save
        redirect '/items'
    end


    #displays edit form based on ID in the url
    get '/items/:id/edit' do
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

    #deletes one item based on ID in the url
    delete '/items/:id' do
        @item = Item.find(params["id"])
        @item.destroy
        redirect '/items'
    end

end