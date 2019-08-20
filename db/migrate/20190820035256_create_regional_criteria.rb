class CreateRegionalCriteria < ActiveRecord::Migration[5.2]
  def change
    create_table :regional_criteria do |t|
      t.string :distribution_code

      t.timestamps
    end
  end
end
