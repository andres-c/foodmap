# Map page
get '/restaumap' do
  thing = Restaurant.where("latitude BETWEEN #{params[:lat1]} AND #{params[:lat2]} AND longitude BETWEEN #{params[:lon1]} AND #{params[:lon2]}").map do |restaurant|
    {
      name: restaurant.name,
      address: restaurant.address,
      zomato_rating: restaurant.zomato_rating,
      latitude: restaurant.latitude,
      longitude: restaurant.longitude
    }
  end.to_json
end
