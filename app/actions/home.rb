# Homepage (Root path)
get '/' do
  redirect '/map'
end

get '/map' do
  if session[:user_id]
    @user = User.find(session[:user_id])
  end
  erb :map 
end

get '/show/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb :show
end

get '/favourites' do
  erb :favourites
end
