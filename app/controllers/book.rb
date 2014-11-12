get '/books' do
  erb :books
  # see books available
end

get '/books/search' do
  @books = Book.new.book_search(params[:searched_item])
  erb :book_search_results
end

get '/books/add' do
  @title = params[:title]
  @author = params[:author]
  @book_cover = params[:book_cover]
end



post '/books/add/' do
  add_book_to_collection(params[:title], params[:author], params[:book_cover])
  redirect 'account/collection'
end