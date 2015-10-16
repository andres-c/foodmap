class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :favorites

  def voted_rating
    return 100
  end
end