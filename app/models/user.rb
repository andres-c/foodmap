class User < ActiveRecord::Base
  has_secure_password
  has_many :votes
  has_many :reviews
  has_many :favorites
end