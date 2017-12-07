class AddUuidToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :uuid, :string, null: false

    add_index :trips, :uuid, unique: true
  end
end
