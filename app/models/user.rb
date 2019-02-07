class User < ApplicationRecord
  validates :username, :email, presence: true
  validates :password_digest, presence: true, confirmation: true, length: { minimum: 8 }

  has_secure_password
end
