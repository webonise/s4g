class AddOfficeLocationToCauses < ActiveRecord::Migration
  def change
    add_column :causes, :location, :string
  end
end
