class DropPostalCodeFromPlaces < ActiveRecord::Migration[5.1]
  def up
    remove_column(:places, :postal_code)
  end

  def down
    add_column(:places, :postal_code, :string)
  end
end
