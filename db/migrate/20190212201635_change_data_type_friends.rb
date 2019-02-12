class ChangeDataTypeFriends < ActiveRecord::Migration[5.2]
  def change
    change_column :friends, :follower_id, 'integer USING CAST(follower_id AS integer)', index: true
    change_column :friends, :friend, 'integer USING CAST(friend AS integer)'
  end
end


