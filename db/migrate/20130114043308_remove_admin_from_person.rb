class RemoveAdminFromPerson < ActiveRecord::Migration
  def up
    remove_column :people, :admin
  end

  def down
    add_column :people, :admin, :boolean
  end
end
