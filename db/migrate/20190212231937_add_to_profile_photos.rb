class AddToProfilePhotos < ActiveRecord::Migration[5.2]
  def change
    add_reference :profile_photos, :photo, index: true
  end
end
