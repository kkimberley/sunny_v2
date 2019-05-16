class AddGredientTypeToGredient < ActiveRecord::Migration[5.2]
  def change
    add_reference :ingredients, :ingredient_type, foreign_key: true
  end
end
