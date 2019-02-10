class AddToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :address, :string
    add_column :profiles, :birthday, :date
    add_column :profiles, :phone, :string

  end
end
