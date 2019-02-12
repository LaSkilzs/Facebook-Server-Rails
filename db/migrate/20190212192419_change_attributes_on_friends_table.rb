class ChangeAttributesOnFriendsTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :friends, :name, :follower_id
    rename_column :friends, :location, :friend
  end
end
