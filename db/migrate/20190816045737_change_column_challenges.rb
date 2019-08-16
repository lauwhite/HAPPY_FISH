class ChangeColumnChallenges < ActiveRecord::Migration[5.2]
  def change
    change_column :challenges, :score_happiness, :decimal, precision: 10, scale: 2
  end
end
