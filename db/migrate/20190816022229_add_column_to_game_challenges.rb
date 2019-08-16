class AddColumnToGameChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :game_challenges, :status, :string
  end
end
