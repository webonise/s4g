class AddCityToBusinessCompanies < ActiveRecord::Migration
  def change
    add_column :business_companies, :city, :string
  end
end
