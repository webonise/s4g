class AddLogoToBusinessCompanies < ActiveRecord::Migration
  def change
    add_column :business_companies, :logo, :string
  end
end
