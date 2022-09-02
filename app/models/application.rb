class Application < ApplicationRecord
  belongs_to :category
  has_many :bookmarks, dependent: :destroy
  has_many :countries, through: :bookmarks
  has_one_attached :photo
end
