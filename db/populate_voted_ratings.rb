require_relative '../config/environment'

Restaurant.all.each do |restaurant|
  restaurant.upvotes = Random.rand(1000)
  restaurant.downvotes = Random.rand(100)
  restaurant.total_votes = restaurant.upvotes + restaurant.downvotes
  restaurant.save
end