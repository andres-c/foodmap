#login/signup/logout actions
post '/login' do
  user = User.find_by(email: params[:email])

  session[:user_id] = user.id if user && user.authenticate(params[:password])
    
  redirect params[:fullpath]
end

post '/signup' do
  @user = User.new(
    username: params[:username],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation],
    isAdmin: false
  )
  
  session[:user_id] = @user.id if @user.save
  
  redirect params[:fullpath]
end

post "/logout" do
  session.delete(:user_id)
  
  redirect params[:fullpath]
end