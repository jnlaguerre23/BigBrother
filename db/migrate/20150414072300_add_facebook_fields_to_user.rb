class AddFacebookFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string, :default => 'local'
    add_column :users, :uid, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expires_at, :timestamp
    add_index :users,  :uid
    add_index :users, :provider
  end
end
