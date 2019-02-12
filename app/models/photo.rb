class Photo < ApplicationRecord
  belongs_to :user
  has_many :profile_photos
end
