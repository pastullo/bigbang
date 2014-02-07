class AddOptinToUsers < ActiveRecord::Migration
  def up
    add_column :users, :optin, :boolean
  end
  def down
  	remove_column :users, :optin
  end
end
