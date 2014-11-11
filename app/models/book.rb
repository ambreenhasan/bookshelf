require 'googlebooks'

class Book < ActiveRecord::Base
  # Remember to create a migration!
  has_many :book_ownerships
  has_many :users, through: :book_ownerships

  def book_search(book)
    GoogleBooks.search(book)
  end
end
