class CreateThreats < ActiveRecord::Migration[5.2]
  def change
    create_table :threats do |t|
      t.string :code
      t.string :title
      t.string :timing
      t.string :scope
      t.string :severity
      t.string :score

      t.timestamps
    end
  end
end
