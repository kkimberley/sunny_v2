class IngredientType < ApplicationRecord
  has_many :ingredients
  has_many :inventories
end
