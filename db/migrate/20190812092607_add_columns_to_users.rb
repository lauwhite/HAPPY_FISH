class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :country, :string
    add_column :users, :avatar, :string
    add_reference :users, :level, foreign_key: true
    add_column :users, :admin, :boolean
    add_column :users, :score, :integer
  end
end
