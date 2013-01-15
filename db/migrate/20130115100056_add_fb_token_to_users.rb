class AddFbTokenToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :fb_token, :string, :default => nil
  end

  def self.down
    remove_column :users, :fb_token, :string
  end
end
