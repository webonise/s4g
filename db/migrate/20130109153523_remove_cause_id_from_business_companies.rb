class RemoveCauseIdFromBusinessCompanies < ActiveRecord::Migration
  def up
    remove_column :business_companies, :causes_id
  end

  def down
    add_column :business_companies, :causes_id, :integer
  end
end
