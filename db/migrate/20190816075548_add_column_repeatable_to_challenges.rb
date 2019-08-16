class AddColumnRepeatableToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :repeatable, :boolean
  end
end
