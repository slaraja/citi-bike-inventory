class User < ActiveRecord::Base
    has_many :items #method from AR
    has_secure_password  #method from AR that is called upon User class
    #provides reader/writer method for password
    #provides a .authenticate method - looks at password_digest 
        #and looks at salt, and runs it through the algorithm to see if passwords are the same
    #only works with gem bcrypt
    #gives us a method that "password =" 
    #@password = plain_password
    #adds "salt" to the plain_password 
    #converts @password_digest to become hashed through bcrypt
end 
