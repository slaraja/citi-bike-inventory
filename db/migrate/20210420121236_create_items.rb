class CreateItems < ActiveRecord::Migration[6.1]
  #change instance method
  #can be applied and undone - replaces up/down methods
  def change
    create_table :items do |t| #items must be plural to work right
      #creates a table items
      #set up like a block that we are sending in
      #for this table, I would like specific columns to be added
      #when it's run title is passed in as an argument
      t.string :name #attribute is passed in as an argument. 
      #creates a column and creates an attribute accessor
      t.string :size
      t.integer :year
      t.text :condition
      t.boolean :status
      #ruby data types - string, integer, date, booleans, etc.
    end

  end
end
