class CreateSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :spots do |t|
      t.string :name
      t.text :description
      t.string :country
      t.string :city
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :open_hours
      t.boolean :wifi
      t.boolean :power

      t.timestamps
    end
  end
end
