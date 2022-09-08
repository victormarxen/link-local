class Favourite < ApplicationRecord
  belongs_to :bookmark
  belongs_to :user

  validates_uniqueness_of :user, scope: [:bookmark]
end
