class ChangeColumnDataType < ActiveRecord::Migration[5.2]
  def change
    change_column :inventories, :price, :float, default: 1
  end
end
