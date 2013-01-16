class AddContactNoToCauses < ActiveRecord::Migration
  def change
    add_column :causes, :contact_no, :integer
  end
end
