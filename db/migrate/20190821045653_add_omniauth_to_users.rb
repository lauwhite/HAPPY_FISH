class AddOmniauthToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :facebook_picture_url, :string
    add_column :users, :token, :string
    add_column :users, :token_expiry, :datetime
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
