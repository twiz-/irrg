class AddApprovedToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :approved, :boolean, default: false, null: false
    add_index :users, :approved
  end
  
  def self.down
    remove_index :user, :approved
    remove_column :user, :approved 
  end
end
