class AddCauseIdToBusinessCompanies < ActiveRecord::Migration
  def change
    add_column :business_companies, :cause_id, :integer
  end
end
