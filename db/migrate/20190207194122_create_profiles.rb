class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :location
      t.string :movie
      t.string :animal
      t.string :sport
      t.string :interests

      t.timestamps
    end
  end
end
