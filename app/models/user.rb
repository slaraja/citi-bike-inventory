class User < ActiveRecord::Base
    has_many :units
    has_secure_password   #from ActiveRecord
end 