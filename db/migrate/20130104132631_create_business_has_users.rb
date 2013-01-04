class CreateBusinessHasUsers < ActiveRecord::Migration
  def change
    create_table :business_has_users do |t|
      t.references :user
      t.references :business_company

      t.timestamps
    end
    add_index :business_has_users, :user_id
    add_index :business_has_users, :business_company_id
  end
end
