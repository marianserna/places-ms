class AddUniqueTripIdAndUserIdToBuddies < ActiveRecord::Migration[5.1]
  def change
    add_index :buddies, [:user_id, :trip_id], unique: true
  end
end
