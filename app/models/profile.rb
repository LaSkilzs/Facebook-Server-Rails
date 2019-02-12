class Profile < ApplicationRecord
validates :name, :location, presence: true
has_many :profile_photos
has_many :photos, :through => :profile_photos
end
