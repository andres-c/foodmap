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

post '/show/vote' do
  prior_vote = Vote.where(restaurant_id: params[:restaurant_id]).find_by(user_id: session[:user_id])
  
  if prior_vote
    prior_vote.destroy
  else
    Vote.create(user_id: session[:user_id], restaurant_id: params[:restaurant_id], value: params[:value])
  end

  redirect "/show/#{params[:restaurant_id]}"
end

get '/show/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb :show
end