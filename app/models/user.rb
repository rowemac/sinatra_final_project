class User < ActiveRecord::Base
    has_secure_password
    has_many :libraries
    has_many :albums, through: :libraries
end 