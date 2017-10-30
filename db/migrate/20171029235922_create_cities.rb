class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :country, null: false
      t.string :province, null: false
      t.decimal :lat, null: false
      t.decimal :lon, null: false

      t.timestamps
    end
  end
end
