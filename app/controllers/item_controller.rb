class ItemController < ApplicationController
    
    #get all the items
    get '/items' do
        erb :"items/index" 
    end

end