class Ingredient < ApplicationRecord
  has_many :inventories
  belongs_to :ingredient_type
end
