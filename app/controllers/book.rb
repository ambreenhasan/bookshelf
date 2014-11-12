get '/books' do
  erb :books
  # see books available
end

get '/books/search' do
  @books = Book.new.book_search(params[:searched_item])
  erb :book_search_results
end

get '/books/add' do

end



post '/books/add' do
  new_book = Book.new(title: params[:title], author: params[:author], book_cover: params[:book_cover], isbn:params[:isbn])

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

# find id of current user
# create a new book with params
# shovel new book into current_user.books
# redirect to collection to see new book in collection

#       new_book = Book.new(title: title, author: author, book_cover: book_cover)
        # if new_book.save
#       @current_user.books << new_book
        #redirect
        #else
        #error
#   end