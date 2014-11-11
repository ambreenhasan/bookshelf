get '/books' do
  erb :books
  # see books available
end

get '/books/search/:searched_item'
  @books = Book.book_search(params[:searched_item])
#googlebooks ruby wrapper
  erb :book_search_results
end