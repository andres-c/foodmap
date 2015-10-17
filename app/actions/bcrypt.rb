
post '/login' do
 user = User.find_by(
   email: params[:email],
 )
 if user and user.authenticate(params[:password])
   session[:user_id] = user.id
   redirect params[:fullpath]
 else
   redirect params[:fullpath]
 end
end

post '/signup' do
 @user = User.new(
   username: params[:username],
   email: params[:email],
   password: params[:password],
   password_confirmation: params[:password_confirmation],
   isAdmin: false
 )
  if @user.save
    session[:user_id] = @user.id
    redirect params[:fullpath]
  else
    redirect params[:fullpath]
  end
end

post "/logout" do
  session.delete(:user_id)
  redirect params[:fullpath]
end