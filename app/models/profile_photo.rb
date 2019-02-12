class ProfilePhoto < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  belongs_to :photo
end
