class AddBookamrkToFavourites < ActiveRecord::Migration[7.0]
  def change
    add_reference :favourites, :bookmark, null: false, foreign_key: true
  end
end
