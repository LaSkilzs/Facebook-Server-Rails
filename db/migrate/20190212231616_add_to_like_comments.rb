class AddToLikeComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :like_comments, :comment, index: true
  end
end
