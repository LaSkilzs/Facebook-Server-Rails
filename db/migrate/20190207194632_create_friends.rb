class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.string :name
      t.string :location
      t.integer :mutual_friends
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
