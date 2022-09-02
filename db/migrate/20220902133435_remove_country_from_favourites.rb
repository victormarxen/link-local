class RemoveCountryFromFavourites < ActiveRecord::Migration[7.0]
  def change
    remove_reference :favourites, :country, null: false, foreign_key: true
  end
end
