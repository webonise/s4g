class CreateBusinessUsers < ActiveRecord::Migration
  def change
    create_table :business_users do |t|

      t.references :person
      t.timestamps
    end
    add_index :business_users, :person_id
  end
end
