class Application < ApplicationRecord
  belongs_to :category
  has_many :bookmarks
  has_many :countries, through: :bookmarks
end
