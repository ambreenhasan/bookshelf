after do
  ActiveRecord::Base.connection.close
end

get '/' do
  erb :index
end

get '/signup' do
  erb :signup
# a user can sign up for an account
end

post '/signup' do
  #creates a new user and redirects to account page

  current_user = User.new(name: params[:name], email: params[:email], password: params[:password])

  if current_user.save
    p session[:user_id] = current_user.id
    redirect '/account'
  else
    redirect '/error'
  end

end

get '/login' do
  # a user can login
  erb :login
end

post '/login' do
  current_user = User.find_by_email(params[:email])

  if current_user.password == params[:password]
    session[:user_id] = current_user.id
    redirect '/account'
  else
    redirect '/'
  end
  #authenticates the user and assigns to session to current_user
  # redirect to account page
end


get '/logout' do
  session.clear
  redirect '/'
  # a user can log out, clear session and redirect to '/'
end





