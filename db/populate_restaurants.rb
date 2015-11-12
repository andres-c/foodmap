require 'open-uri'
require_relative '../config/environment'

# require_relative 'zomato_key'

result_count = 0

restaurants = []

loop do
  api_query = open(
    "https://developers.zomato.com/api/v2.1/search?entity_id=89&entity_type=city&start=#{result_count}&count=20",
    "Accept" => "application/json",
    "user_key" => ENV['ZOMATO_KEY']
  )

  result_string = ""

  api_query.each_line { |json| result_string += json }

  result_hash = JSON(result_string)

  restaurants +=  result_hash["restaurants"]

  result_count += 20
  puts "#{[result_count, result_hash['results_found']].min} / #{result_hash['results_found']} results parsed" if result_count % 100 == 0 || result_count >= result_hash['results_found']
  break if result_count >= 100
end

restaurants.each do |restaurant|
  restaurant = restaurant['restaurant']
  Restaurant.create(name: restaurant['name'], zomato_id: restaurant['id'], address: restaurant['location']['address'], locality: restaurant['location']['locality'], latitude: restaurant['location']['latitude'], longitude: restaurant['location']['longitude'], zomato_rating: restaurant['user_rating']['aggregate_rating'])
end
