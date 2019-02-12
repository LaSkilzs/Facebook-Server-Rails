class ProfilePhoto < ApplicationRecord
  belongs_to :profile
  belongs_to :photo
end
