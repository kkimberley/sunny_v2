class AddIngredientTypeToInventory < ActiveRecord::Migration[5.2]
  def change
    add_reference :inventories, :ingredient_type, foreign_key: true
  end
end
