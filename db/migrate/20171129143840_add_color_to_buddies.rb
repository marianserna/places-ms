class AddColorToBuddies < ActiveRecord::Migration[5.1]
  def change
    add_column :buddies, :color, :string, null: false, default: '#9068BE'
  end
end
