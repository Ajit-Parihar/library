class Book < ApplicationRecord
  has_one_attached :bookCover
end
