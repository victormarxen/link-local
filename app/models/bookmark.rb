class Bookmark < ApplicationRecord
  belongs_to :country
  belongs_to :application
end
