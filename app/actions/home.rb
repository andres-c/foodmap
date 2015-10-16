# Homepage (Root path)
get '/' do
  redirect '/map'
end

get '/map' do
  erb :map
end

get '/show/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb :show
end