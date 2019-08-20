class CreateCriteriaByYears < ActiveRecord::Migration[5.2]
  def change
    create_table :criteria_by_years do |t|
      t.references :fish, foreign_key: true
      t.integer :year
      t.references :endangered_status, foreign_key: true

      t.timestamps
    end
  end
end
