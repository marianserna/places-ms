class AddCaptionAndRemovePlaceIdFromTripImages < ActiveRecord::Migration[5.1]
  def change
    add_column :trip_images, :caption, :string
    remove_column :trip_images, :place_id, :integer
  end
end
