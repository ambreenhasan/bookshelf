get '/account' do
  erb :account
end

get '/account/currently_reading' do
  @books = current_user.book_ownerships.where(completed: false)
  erb :currently_reading
end

get '/account/currently_reading/books/:book_id/edit' do
  @books = current_user.book_ownerships.find_by_book_id(params[:book_id])
  erb :current_progress
end

# [PUT] current user can update the current page of a book they are currently reading
put'/account/currently_reading/books/:book_id/edit' do
  user = current_user.book_ownerships.find_by_book_id(params[:book_id])
  user.update_attributes(current_page: params[:current_page])
  redirect '/account/currently_reading'
end

get '/account/currently_reading/books/:book_id/completed' do
  @books = current_user.book_ownerships.find_by_book_id(params[:book_id])
end

put '/account/currently_reading/books/:book_id/completed' do
  user = current_user.book_ownerships.find_by_book_id(params[:book_id])
  user.update_attributes(completed: true)
  redirect '/account/currently_reading'
end

get '/account/completed' do
  @books = current_user.book_ownerships.where(completed: true)
  # @books.first.book
  erb :completed
end

get '/account/reviews' do
  @books = current_user.book_ownerships.where(completed: true)
  erb :reviews
end