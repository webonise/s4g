class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.references :business_company
      t.timestamps
    end
    add_index :posts, [:business_company_id, :created_at]
  end
end
