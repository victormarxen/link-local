class Country < ApplicationRecord
  has_many :favourites, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
end
