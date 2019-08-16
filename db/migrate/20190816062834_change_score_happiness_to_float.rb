class ChangeScoreHappinessToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :challenges, :score_happiness, :float
  end
end
