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

get '/account/reviews/books/:book_id/review' do
  @books = current_user.book_ownerships.find_by_book_id(params[:book_id])
  @books_info = current_user.books.find(params[:book_id])
  erb :review_form
end

put '/account/reviews/books/:book_id/review' do
  user = current_user.book_ownerships.find_by_book_id(params[:book_id])
  user.update_attributes(book_review: params[:book_review])
  redirect '/account/reviews'
end

get '/account/collection' do
  @books = current_user.books
  @book_ownerships = current_user.book_ownerships
  erb :collection
end

put '/account/currently_reading/books/:book_id' do
  user = current_user.book_ownerships.find_by_book_id(params[:book_id])
  user.update_attributes(currently_reading: true)
  redirect '/account/currently_reading'
end