class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :person

      t.timestamps
    end
    add_index :users, :person_id
  end
end
