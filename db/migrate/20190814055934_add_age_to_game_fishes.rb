class AddAgeToGameFishes < ActiveRecord::Migration[5.2]
  def change
    add_column :game_fishes, :age, :integer
  end
end
