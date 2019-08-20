class CreateFishThreats < ActiveRecord::Migration[5.2]
  def change
    create_table :fish_threats do |t|
      t.references :fish, foreign_key: true
      t.references :threat, foreign_key: true

      t.timestamps
    end
  end
end
