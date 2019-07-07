class AddColumnForAdjustment < ActiveRecord::Migration[5.2]
  def change
    add_column :inventories, :adjust_symbol, :string
    add_column :inventories, :adjust_price, :float
    add_column :inventories, :price_after_adjust, :float
  end
end
