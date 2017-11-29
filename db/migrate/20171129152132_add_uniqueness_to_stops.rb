class AddUniquenessToStops < ActiveRecord::Migration[5.1]
  def change
    add_index :stops, [:trip_id, :place_id], unique: true
  end
end
