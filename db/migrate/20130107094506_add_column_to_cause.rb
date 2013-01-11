class AddColumnToCause < ActiveRecord::Migration
  def change
    add_column :causes, :logo, :string
  end
end
