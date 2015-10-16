# Homepage (Root path)
get '/' do
  redirect '/map'
end

get '/map' do
  erb :map 
end