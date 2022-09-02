class RemoveApplicationFromFavourites < ActiveRecord::Migration[7.0]
  def change
    remove_reference :favourites, :application, null: false, foreign_key: true
  end
end
