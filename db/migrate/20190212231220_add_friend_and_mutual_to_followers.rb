class AddFriendAndMutualToFollowers < ActiveRecord::Migration[5.2]
  def change
    add_column :followers, :friend, :integer
    add_column :followers, :mutual_friends, :integer
  end
end
