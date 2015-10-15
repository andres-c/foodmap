class User < ActiveRecord::Base
  has_many :votes
  has_many :reviews
  has_many :favorites
end