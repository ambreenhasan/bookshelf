get '/' do
  erb :index
end

get '/books' do
  erb :books
  # see books available
end

get '/signup' do
  erb :signup
# a user can sign up for an account
end

post '/signup' do
  #creates a new user and redirects to account page
  new_user = User.create(params[:user])
  session[:user_id] = new_user.id
  redirect '/account'
end

get '/login' do
  # a user can login
  erb :login
end

post '/login' do
  user = User.find(params[:id])

  if user.password == params[:password]
    session[:user_id] = user.id
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





