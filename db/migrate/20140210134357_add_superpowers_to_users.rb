class AddSuperpowersToUsers < ActiveRecord::Migration
  def up
    add_column :users, :superpower, :boolean
  end
  def down
  	remove_column :users, :superpower
  end
end
