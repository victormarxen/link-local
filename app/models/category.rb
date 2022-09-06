class Category < ApplicationRecord
  has_many :applications, dependent: :destroy
  has_one_attached :photo
end
