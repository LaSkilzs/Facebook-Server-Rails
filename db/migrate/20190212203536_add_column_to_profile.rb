class AddColumnToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :image1, :string
    add_column :profiles, :image2, :string
    add_column :profiles, :friends, :integer
    add_column :profiles, :followers, :integer
  end
end
