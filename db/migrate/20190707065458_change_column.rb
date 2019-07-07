class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :inventories, :number, :integer, default: 1
  end
end
