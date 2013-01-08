class AddPersonRoleToPerson < ActiveRecord::Migration
  def change
    add_column :people, :person_role, :string
  end
end
