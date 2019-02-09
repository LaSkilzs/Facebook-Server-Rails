class User < ApplicationRecord
  validates :username, :email, presence: true
  validates :password_digest, presence: true,  length: 
  { minimum: 8 }
  validates :email, :username, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  has_secure_password
  has_many :friends
  has_many :likedposts
  has_many :posts, :through => :likedpost
  has_many :likecomments
  has_many :comments, :through => :likedcomments
end
