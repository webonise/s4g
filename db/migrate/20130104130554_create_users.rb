class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.references :person

      t.timestamps
    end
    add_index :users, :person_id
  end
end
