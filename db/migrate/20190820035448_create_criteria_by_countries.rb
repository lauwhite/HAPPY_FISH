class CreateCriteriaByCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :criteria_by_countries do |t|
      t.references :fish, foreign_key: true
      t.references :regional_criteria, foreign_key: true
      t.string :country
      t.string :country_code

      t.timestamps
    end
  end
end
