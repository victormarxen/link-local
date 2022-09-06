class Country < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
    def full_name
      country = ISO3166::Country[name]
      country.translations[I18n.locale.to_s] || country.common_name || country.iso_short_name
    end
end
