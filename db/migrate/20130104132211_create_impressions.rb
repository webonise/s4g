class CreateImpressions < ActiveRecord::Migration
  def change
    create_table :impressions do |t|
      t.float :fund_raise
      t.references :post
      t.references :user

      t.timestamps
    end
    add_index :impressions, :user_id
    add_index :impressions, :post_id
  end
end
