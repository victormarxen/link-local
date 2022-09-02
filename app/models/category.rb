class Category < ApplicationRecord
  has_many :applications, dependent: :destroy
end
