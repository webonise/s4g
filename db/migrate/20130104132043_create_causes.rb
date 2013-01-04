class CreateCauses < ActiveRecord::Migration
  def change
    create_table :causes do |t|
      t.string :cause_name
      t.string :description
      t.string :url
      t.string :address

      t.timestamps
    end
  end
end
