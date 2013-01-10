class AddCountryToBusinessCompanies < ActiveRecord::Migration
  def change
    add_column :business_companies, :country, :string
  end
end
