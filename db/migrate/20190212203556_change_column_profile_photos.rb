class ChangeColumnProfilePhotos < ActiveRecord::Migration[5.2]
  def change
    remove_reference :profile_photos, :user, index: true
  end
end
