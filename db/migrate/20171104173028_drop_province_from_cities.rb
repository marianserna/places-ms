class DropProvinceFromCities < ActiveRecord::Migration[5.1]
  def up
    remove_column(:cities, :province)
  end

  def down
    add_column(:cities, :province, :string)
  end
end
