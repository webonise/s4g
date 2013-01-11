class CreateBusinessHasUsers < ActiveRecord::Migration
  def change
    create_table :business_has_users do |t|
      t.integer :user_id
      t.integer :business_company_id

      t.timestamps
    end
  end
end
