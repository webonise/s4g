class AddBusinessWebsiteToBusinessCompanies < ActiveRecord::Migration
  def change
    add_column :business_companies, :business_website, :string
  end
end
