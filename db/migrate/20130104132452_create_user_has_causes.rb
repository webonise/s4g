class CreateUserHasCauses < ActiveRecord::Migration
  def change
    create_table :user_has_causes do |t|
      t.references :user
      t.references :causes

      t.timestamps
    end
    add_index :user_has_causes, :user_id
    add_index :user_has_causes, :cause_id
  end
end
