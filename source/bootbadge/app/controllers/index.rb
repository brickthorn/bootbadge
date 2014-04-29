
get '/' do
  # Look in app/views/index.erb
  erb :index
end


# ================== SLOGANS =======================
# show all
get '/slogans/' do
  @slogans = Slogan.all
  erb 'slogans/index'.to_sym
end

# new
get '/slogans/new' do 
  @slogan = Slogan.new
  erb 'slogans/new'.to_sym
end

# edit
get '/slogans/:id/edit' do
  @slogan = Slogan.find(params[:id])
  erb 'slogans/edit'.to_sym
end

# show 
get '/slogans/:id' do 
  @slogan = Slogan.find(params[:id])
  erb 'slogans/show'.to_sym
end

# create
post '/slogans/' do 
  slogan = Slogan.create(params[:slogan])
  user = User.find(slogan.user_id)
  redirect "/cohorts/#{user.cohort_id}/users/#{user.id}"
end

# update 
put '/slogans/:id' do 
  slogan = Slogan.find(params[:id])
  slogan.update_attributes(params[:slogan])
  redirect "/slogans/#{slogan.id}"
end


# destroy 
delete '/slogans/:id' do 
  slogan = Slogan.find(params[:id])
  slogan.destroy
  redirect "/slogans/"
end

post '/slogans/:id/vote/' do
  vote = Vote.create(params[:vote])
  puts "-"*50
  p vote  
  slogan = Slogan.find(params[:id])
  user = User.find(slogan.user_id)
  puts "-"*50
  p user
  redirect "cohorts/#{user.cohort_id}/users/#{user.id}"
end


# ==========================  USERS =========================

get '/users/' do 
  @users = User.all
  erb 'users/index'.to_sym
end

get '/users/:id' do 
  @user = User.find(params[:id])
  @slogans = @user.slogans
  erb 'users/show'.to_sym
end

get '/users/:id/slogans/new' do
  @slogan = Slogan.new(user_id: params[:id])  
  @user = User.find(params[:id])
  @cohort = @user.cohort_id
  erb '/slogans/new'.to_sym
end

# create
post 'users/:id/slogans/' do 
  Slogan.create(params[:slogan])
  user = User.find(params[:id])
  redirect "/cohorts/#{user.cohort_id}/users/#{user.id}"
end


# ==========================  COHORT PATHS ========================

get '/cohorts/:id' do 
  @cohort = Cohort.find(params[:id])
  @users = User.find_all_by_cohort_id(params[:id])
  erb '/cohorts/show'.to_sym
end

get '/cohorts/:cohort_id/users/:user_id' do 
  @user = User.find(params[:user_id])
  @cohort = Cohort.find(params[:cohort_id])
  @slogans = @user.slogans.sort {|a, b| b.points <=> a.points } #descending sort
  erb '/users/show'.to_sym
end

# get '/users/:user_id/slogans/new' do 

# get '/:cohort_name/user/:id'
# end

# private 

# def generate_formatted_name(cohort)
#   cohort.name.downcase.join('-') + '-' + cohort.year.to_s
# end




