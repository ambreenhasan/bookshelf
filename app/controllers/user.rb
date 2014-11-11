get '/account' do
  erb :account
end

get '/account/currently_reading' do
  erb :currently_reading
end

# [PUT] current user can update the current page of a book they are currently reading
put'/account/currently_reading/:book_id' do
  user = current_user.book_ownerships.find_by_book_id(params[:book_id])
  user.update_attributes(current_page: params[:current_page])
  redirect '/account/currently_reading'
end


put '/account/currently_reading/:book_id/completed' do
  user = current_user.book_ownerships.find_by_book_id(params[:book_id])
  user.update_attributes(completed: true)
  redirect '/account/currently_reading'
end

get '/account/completed' do
  erb :completed
end

get '/account/reviews' do
  erb :reviews
end