class AddUserToTripImages < ActiveRecord::Migration[5.1]
  def change
    add_column :trip_images, :user_id, :integer, null: false
  end
end
