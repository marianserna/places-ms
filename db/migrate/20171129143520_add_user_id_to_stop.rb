class AddUserIdToStop < ActiveRecord::Migration[5.1]
  def change
    add_column :stops, :user_id, :integer, null: false
  end
end
