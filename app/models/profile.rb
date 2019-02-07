class Profile < ApplicationRecord
validates :name, :location, presence: true
end
