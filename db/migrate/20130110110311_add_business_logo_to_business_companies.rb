class AddBusinessLogoToBusinessCompanies < ActiveRecord::Migration
  def change
    add_column :business_companies, :business_logo, :string
  end
end
