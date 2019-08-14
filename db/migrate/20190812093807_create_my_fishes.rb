class CreateMyFishes < ActiveRecord::Migration[5.2]
  def change
    create_table :my_fishes do |t|
      t.references :user, foreign_key: true
      t.references :fish, foreign_key: true
      t.string :name
      t.datetime :start_date
      t.integer :score_health
      t.integer :score_happiness
      t.boolean :alive
      t.integer :age

      t.timestamps
    end
  end
end
