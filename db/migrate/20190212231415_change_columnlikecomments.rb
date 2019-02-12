class ChangeColumnlikecomments < ActiveRecord::Migration[5.2]
  def change
    remove_reference :like_comments, :post, index: true
    remove_column :like_comments, :comment, :string
  end
end
