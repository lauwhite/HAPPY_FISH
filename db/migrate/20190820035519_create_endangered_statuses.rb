class CreateEndangeredStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :endangered_statuses do |t|
      t.string :abbreviation
      t.string :status

      t.timestamps
    end
  end
end
