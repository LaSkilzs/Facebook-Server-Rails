class CreateLikedPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :liked_posts do |t|
      t.integer :likes
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
