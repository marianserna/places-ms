class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :name, null: false
      t.string :activity_type, null: false
      t.decimal :lat, null: false
      t.decimal :lon, null: false
      t.integer :city_id, null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.string :google_id, null: false
      t.string :category, null: false

      t.timestamps
    end

    add_index :places, :city_id
    add_index :places, :google_id
  end
end
