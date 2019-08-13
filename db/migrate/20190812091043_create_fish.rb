class CreateFish < ActiveRecord::Migration[5.2]
  def change
    create_table :fish do |t|
      t.string :breed
      t.string :location
      t.string :endangered_status
      t.string :fish_avatar
      t.integer :min_score
      t.integer :max_age

      t.timestamps
    end
  end
end
