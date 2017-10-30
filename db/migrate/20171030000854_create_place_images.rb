class CreatePlaceImages < ActiveRecord::Migration[5.1]
  def change
    create_table :place_images do |t|
      t.integer :place_id, null: false
      t.string :image, null: false

      t.timestamps
    end

    add_index :place_images, :place_id
  end
end
