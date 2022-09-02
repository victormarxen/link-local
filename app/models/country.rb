class Country < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
end
