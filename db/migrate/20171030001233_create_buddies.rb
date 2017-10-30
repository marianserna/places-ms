class CreateBuddies < ActiveRecord::Migration[5.1]
  def change
    create_table :buddies do |t|
      t.string :email, null: false
      t.integer :trip_id, null: false
      t.integer :user_id, null: false
      t.string :uid, null: false

      t.timestamps
    end

    add_index :buddies, :trip_id
    add_index :buddies, :user_id
    add_index :buddies, :uid, unique: true
    # Each email address can be invited only once per trip
    add_index :buddies, [ :email, :trip_id ], unique: true
  end
end
