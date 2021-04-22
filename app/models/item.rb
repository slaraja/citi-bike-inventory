class Item < ActiveRecord::Base 
    #inherits from AR Base
    #gives us a bunch of methods
    #makes a connection from AR to our DB in environ
    belongs_to :unit
    belongs_to :user
end