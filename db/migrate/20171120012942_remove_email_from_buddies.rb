class RemoveEmailFromBuddies < ActiveRecord::Migration[5.1]
  def up
    remove_column(:buddies, :email)
    remove_column(:buddies, :uid)
  end

  def down
    add_column(:buddies, :email, :string)
    add_column(:buddies, :uid, :string)
  end
end
