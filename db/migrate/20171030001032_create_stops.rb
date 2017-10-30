class CreateStops < ActiveRecord::Migration[5.1]
  def change
    create_table :stops do |t|
      t.integer :trip_id, null: false
      t.integer :place_id, null: false

      t.timestamps
    end

    add_index :stops, :trip_id
    add_index :stops, :place_id
  end
end
