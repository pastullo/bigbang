class AddBangleftToUsers < ActiveRecord::Migration
  def up
    add_column :users, :bangsleft, :integer, :default => 15
  end
  def down
  	remove_column :users, :bangsleft
  end
end
