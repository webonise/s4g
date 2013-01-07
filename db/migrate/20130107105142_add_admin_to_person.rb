class AddAdminToPerson < ActiveRecord::Migration
  def change
    add_column :people, :admin, :boolean
  end

  def self.up
    add_column :people, :admin, :boolean, :default => false
  end

  def self.down
    remove_column :people, :admin
  end
end
