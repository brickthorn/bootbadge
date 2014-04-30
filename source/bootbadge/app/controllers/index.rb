
get '/' do
  # Look in app/views/index.erb
  erb :index
end


# ================== SLOGANS =======================
# show all (admin - hidden)   
get '/slogans/' do
  @slogans = Slogan.all
  erb 'slogans/index'.to_sym
end

# edit (admin - hidden)
get '/slogans/:id/edit' do
  @slogan = Slogan.find(params[:id])
  erb 'slogans/edit'.to_sym
end

# show (admin - hidden)
get '/slogans/:id' do 
  @slogan = Slogan.find(params[:id])
  erb 'slogans/show'.to_sym
end

# update (admin - hidden) 
put '/slogans/:id' do 
  slogan = Slogan.find(params[:id])
  slogan.update_attributes(params[:slogan])
  redirect "/slogans/#{slogan.id}"
end


# destroy (admin - hidden)
delete '/slogans/:id' do 
  slogan = Slogan.find(params[:id])
  slogan.destroy
  redirect "/slogans/"
end

# create a vote
post '/slogans/:id/vote/' do
  vote = Vote.create(params[:vote])
  slogan = Slogan.find(params[:id])
  user = User.find(slogan.user_id)
  redirect "cohorts/#{user.cohort_id}/users/#{user.id}"
end


# ==========================  USERS =========================

# show all (admin - hidden)   
get '/users/' do 
  @users = User.all
  erb 'users/index'.to_sym
end

# show (admin - hidden)
get '/users/:id' do 
  @user = User.find(params[:id])
  @slogans = @user.slogans
  @cohort = @user.cohort
  erb 'users/show'.to_sym
end

post '/users/:id/slogans/' do 
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

  @slogans = @user.slogans.sort {|a, b| b.points <=> a.points } #descending sort by points
  erb '/users/show'.to_sym
end





