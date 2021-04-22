class User < ActiveRecord::Base
    has_many :units #method from AR
    has_secure_password  #method from AR that is called upon User class
    #only works with gem bcrypt
    #gives us a method that "password =" 
    #@password = plain_password
    #adds "salt" to the plain_password 
    #converts @password_digest to become hashed through bcrypt
end 
