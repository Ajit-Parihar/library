class User < ApplicationRecord
  has_many :books
  has_one_attached :profileImage
  has_secure_password
end
