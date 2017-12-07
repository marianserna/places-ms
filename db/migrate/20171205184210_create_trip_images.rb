class CreateTripImages < ActiveRecord::Migration[5.1]
  def change
    create_table :trip_images do |t|
      t.integer :trip_id, null: false
      t.string :image
      t.integer :place_id, null: false

      t.timestamps
    end

    add_index :trip_images, :trip_id
    add_index :trip_images, :place_id
  end
end
