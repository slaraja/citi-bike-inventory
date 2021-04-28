class ItemController < ApplicationController
    
    #get all the items
    get '/items' do
        @items = Item.all
        #accesses all the movies
        erb :"items/index" 
    end

    #displays create new item form
    get '/items/new' do
        if !logged_in?
            #leave the method if not logged in
            redirect '/login' 
        end
        erb :"items/new"
    end

    #displays one item based on the id in the url
     get '/items/:id' do
        @item = Item.find(params["id"])
        erb :"items/show"
    end

    #creates one item
    post '/items' do
        if !logged_in?
            #leave the method if not logged in
            redirect '/login' 
        end
        item = Item.new(params)
        #assigns the item to the user
        #item = current_user.items.build(params)
        #build acts similar to new, but builds association
        item.user_id= session[:user_id]
        item.save
        redirect '/items'
    end


    #displays edit form based on ID in the url
    get '/items/:id/edit' do
        @item = Item.find(params["id"])
        erb :"items/edit"
    end

    patch 'items/:id' do
        @item = Item.find(params["id"])
        if !logged_in?
            #leave the method if not logged in
            redirect '/login' 
        end
        @item.update(params)["item"]
        item.save
        redirect "/items/#{@item.id}"
    end

    #deletes one item based on ID in the url
    delete 'items/:id' do
        @item = Item.find(params["id"])
        if !logged_in?
            #leave the method if not logged in
            redirect '/login' 
        end
        @item.destroy
        redirect '/items'
    end

end