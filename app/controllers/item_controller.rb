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
            #leave the method - copy and paste where users cannot be logged in
            redirect '/login' 
        end
        erb: "items/new"
    end

    #creates one item
    post '/items' do
        item = Item.new(params)
        #assigns the item to the user
        item.user_id= session[:user_id]
        item.save
        redirect '/items'
    end

    #displays one item based on the id in the url
    get 'items/:id' do
        
    end

    #displays edit form based on ID in the url
    get 'items/:id/edit' do
        
    end

    #modifies an existing item based on ID in the url
    patch 'items/:id' do
        
    end

    #deletes one item based on ID in the url
    delete 'items/:id' do
        
    end

end