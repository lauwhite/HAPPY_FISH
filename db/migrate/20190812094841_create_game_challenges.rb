class CreateGameChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :game_challenges do |t|
      t.references :my_fish, foreign_key: true
      t.references :challenge, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
