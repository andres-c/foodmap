require 'open-uri'
require_relative '../config/environment'
# require_relative 'zomato_key'

restaurants_processed = 0

Restaurant.all.each do |restaurant|

  reviews = nil

  api_query = open(
    "https://developers.zomato.com/api/v2.1/reviews?res_id=#{restaurant.zomato_id}&start=0&count=0",
    "Accept" => "application/json",
    "user_key" => ENV['ZOMATO_KEY']
  )

  result_string = ""

  api_query.each_line { |json| result_string += json }

  result_hash = JSON(result_string)

  reviews = result_hash['user_reviews']

  restaurants_processed += 1

  reviews_processed = 0
  
  reviews.each do |review|
    review = review['review']
    Review.create(username: review['user']['name'], rating: review['rating'], body: review['review_text'], restaurant_id: restaurant.id, created_at: Time.at(review['timestamp'].to_i).to_datetime)
    reviews_processed += 1
    puts "#{reviews_processed} / #{reviews.length} reviews processed for restaurant #{restaurants_processed} / 100"
  end

end