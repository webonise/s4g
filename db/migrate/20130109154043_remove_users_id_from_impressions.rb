class RemoveUsersIdFromImpressions < ActiveRecord::Migration
  def up
    remove_column :impressions, :users_id
  end

  def down
    add_column :impressions, :users_id, :integer
  end
end
