class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :email
      t.string :password
      t.integer :person_role

      t.timestamps
    end
  end
end
