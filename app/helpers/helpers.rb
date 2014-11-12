helpers do


  def current_user
    return nil if !session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def add_book_to_collection(title, author, book_cover)
      new_book = Book.create(title: title, author: author, book_cover: book_cover)
      @current_user.books << new_book
  end
end