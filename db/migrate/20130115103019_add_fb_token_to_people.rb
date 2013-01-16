class AddFbTokenToPeople < ActiveRecord::Migration
  def up
    add_column :people, :fb_token, :string, :default => nil
  end

  def down
    remove_column :people, :fb_token, :string
  end
end
