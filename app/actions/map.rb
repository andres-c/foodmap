# Map page
get '/map' do
  if session[:user_id]
    @user = User.find(session[:user_id])
  end
  
  erb :map 
end

post '/restaumap' do
  lat1 = [params[:lat1].to_f, params[:lat2].to_f].min
  lat2 = [params[:lat1].to_f, params[:lat2].to_f].max
  lon1 = [params[:lon1].to_f, params[:lon2].to_f].min
  lon2 = [params[:lon1].to_f, params[:lon2].to_f].max
  Restaurant.where("latitude BETWEEN #{lat1} AND #{lat2} AND longitude BETWEEN #{lon1} AND #{lon2}").map do |restaurant|   
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
