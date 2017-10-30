class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
      t.integer :place_id, null: false
      t.string :image
      t.integer :rating, null: false
      t.text :text, null: false

      t.timestamps
    end

    add_index :reviews, :user_id
    add_index :reviews, :place_id
  end
end
