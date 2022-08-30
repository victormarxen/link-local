class Favourite < ApplicationRecord
  belongs_to :application
  belongs_to :user
  belongs_to :country
end
