get '/books' do
  erb :books
  # see books available
end

get '/books/search' do
  @books = Book.new.book_search(params[:searched_item])
  erb :book_search_results
end