class AddDayToInventory < ActiveRecord::Migration[5.2]
  def change
    add_column :inventories, :datetime, :datetime
  end
end
