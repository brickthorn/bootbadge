
get '/' do
  # Look in app/views/index.erb
  erb :index
end

# show all
get '/slogans' do
  @slogans = Slogan.all
  erb :slogans
end

# new
get '/slogans/new' do 
  @slogan = Slogan.new
  erb :new
end

# edit
get '/slogans/:id/edit' do
  @slogan = Slogan.find(params[:id])
  erb :edit
end


# show 
get '/slogans/:id' do 
  @slogan = Slogan.find(params[:id])
  erb :show
end

# create
post '/slogans' do 
  @slogan = Slogan.create(content: params[:content])
  redirect "/slogans/#{@slogan.id}"
end

# update 
put '/slogans/:id' do 
  slogan = Slogan.find(params[:id])
  slogan.update_attributes(content: params[:content])
  redirect "/slogans/#{slogan.id}"
end


# destroy 
delete '/slogans/:id' do 
  slogan = Slogan.find(params[:id])
  slogan.destroy
  redirect "/slogans"
end


