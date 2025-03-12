class Admin < ApplicationRecord
  has_many :books
  has_secure_password
end
