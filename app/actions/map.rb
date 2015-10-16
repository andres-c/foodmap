# Map page
get '/restaumap' do
  thing = Restaurant.where("latitude BETWEEN #{params[:lat1]} AND #{params[:lat2]} AND longitude BETWEEN #{params[:lon2]} AND #{params[:lon1]}").map do |restaurant|
    {
      id: restaurant.id,
      name: restaurant.name,
      address: restaurant.address,
      zomato_rating: restaurant.zomato_rating,
      latitude: restaurant.latitude,
      longitude: restaurant.longitude
    }
  end.to_json
end
