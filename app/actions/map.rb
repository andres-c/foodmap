# Map page
get '/map' do
  if session[:user_id]
    @user = User.find(session[:user_id])
  end
  
  erb :map 
end

post '/restaumap' do
  Restaurant.where("latitude BETWEEN #{params[:lat1]} AND #{params[:lat2]} AND longitude BETWEEN #{params[:lon2]} AND #{params[:lon1]}").map do |restaurant|
    {
      id: restaurant.id,
      name: restaurant.name,
      address: restaurant.address,
      rating: restaurant.voted_rating,
      zomato_rating: restaurant.zomato_rating,
      locality: restaurant.locality,
      latitude: restaurant.latitude,
      longitude: restaurant.longitude
    }
  end.to_json
end
