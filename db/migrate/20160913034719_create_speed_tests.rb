class CreateSpeedTests < ActiveRecord::Migration[5.0]
  def change
    create_table :speed_tests do |t|
      t.string :download_speed
      t.string :upload_speed
      t.integer :ping
      t.string :grade
      t.string :isp
      t.references :spot, foreign_key: true

      t.timestamps
    end
  end
end
