class CreateBusinessCompanies < ActiveRecord::Migration
  def change
    create_table :business_companies do |t|
      t.string :business_name
      t.string :address
      t.string :description
      t.integer :contact
      t.references :business_user
      t.references :causes
      t.timestamps
    end
    add_index :business_companies, :business_user_id
    add_index :business_companies, :cause_id
  end
end
