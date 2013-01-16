class AddDesignationToPeople < ActiveRecord::Migration
  def change
    add_column :people, :designation, :string
  end
end
