class ChangeMyFishHappinessScore < ActiveRecord::Migration[5.2]
  def change
    change_column :my_fishes, :score_happiness, :float
  end
end

