class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.string :name
      t.text :description
      t.string :playstore
      t.string :appstore
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
