class ChangeColumnlikeposts < ActiveRecord::Migration[5.2]
  def change
    remove_column :liked_posts, :likes, :integer
  end
end
