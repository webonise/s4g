class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :person

      t.timestamps
    end

  end
end
