# Homepage (Root path)
get '/' do
  redirect '/map'
end

get '/map' do
  erb :map 
<<<<<<< HEAD
end

get '/show/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb :show
end
=======
end
>>>>>>> 5cac556b7602a6f0631be9ab9fa52d9dd2098318
