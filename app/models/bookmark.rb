class Bookmark < ApplicationRecord
  belongs_to :country
  belongs_to :application
  has_one :favourite
end
