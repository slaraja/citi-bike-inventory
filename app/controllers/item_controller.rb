class ItemController < ApplicationController
    
    #get all the items
    get '/items' do
        @items = Item.all
        #accesses all the movies
        erb :"items/index" 
    end

    #displays create new item form
    get '/items/new' do
        
    end

    #creates one item
    post '/items' do
        
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