get '/books' do
  erb :books
end

get '/books/search' do
  @books = Book.new.book_search(params[:searched_item])
  erb :book_search_results
end

get '/books/add' do

end

post '/books/add' do
  new_book = Book.new(params[:book])

  if new_book.save
    current_user.books << new_book
    redirect 'account/collection'
  else
    redirect '/error'
  end
end

get '/error' do
  "Error"
end