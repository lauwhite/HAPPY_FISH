class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.string :name
      t.integer :min_score
      t.string :duration
      t.references :challenge_category, foreign_key: true
      t.string :description
      t.integer :score_health
      t.integer :score_happiness
      t.references :challenge_type, foreign_key: true

      t.timestamps
    end
  end
end
