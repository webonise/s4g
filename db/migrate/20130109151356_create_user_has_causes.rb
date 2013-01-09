class CreateUserHasCauses < ActiveRecord::Migration
  def change
    create_table :user_has_causes do |t|
      t.integer :user_id
      t.integer :cause_id

      t.timestamps
    end
  end
end
