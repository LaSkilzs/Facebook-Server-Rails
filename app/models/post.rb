class Post < ApplicationRecord
  belongs_to :user
  has_many :likedposts
  has_many :comments
end
