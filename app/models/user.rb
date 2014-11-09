require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  # validates :name, presence: true
  # validates :email, presence: true
  # validates :password, presence: true

  # validates :email, uniqueness: true
  # validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }

  # validates :password, length: { in: 6..20 }

  has_many :book_ownerships
  has_many :books, through: :book_ownerships

  has_many :follower_relationships, class_name: "Relationship", foreign_key: "followed_id"
  has_many :followed_relationships, class_name: "Relationship", foreign_key: "follower_id"

  has_many :followers, through: :follower_relationships
  has_many :followeds, through: :followed_relationships

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def follow user
    Relationship.create follower_id: self.id, followed_id: user.id
  end
end
