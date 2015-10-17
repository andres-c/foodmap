class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  after_create :increment_restaurant
  after_destroy :decrement_restaurant

  private

  def increment_restaurant
    if value == 1
      restaurant.upvotes += 1
    elsif value == -1 
      restaurant.downvotes += 1
    end

    restaurant.total_votes += 1

    restaurant.save
  end

  def decrement_restaurant
    if value == 1
      restaurant.upvotes -= 1
    elsif value == -1 
      restaurant.downvotes -= 1
    end

    restaurant.total_votes -= 1

    restaurant.save
  end
end