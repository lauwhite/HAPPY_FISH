class ChangeColumnHappinessChallenges < ActiveRecord::Migration[5.2]
  def change
    change_column :challenges, :score_happiness, :decimal
  end
end
