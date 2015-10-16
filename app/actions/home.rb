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


