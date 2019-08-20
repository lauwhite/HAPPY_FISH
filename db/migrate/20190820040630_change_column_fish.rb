class ChangeColumnFish < ActiveRecord::Migration[5.2]
  def change
    remove_column :fish, :endangered_status, :string
    add_reference :fish, :endangered_status, foreign_key: true
  end
end
