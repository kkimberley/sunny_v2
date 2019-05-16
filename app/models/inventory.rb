class Inventory < ApplicationRecord
  belongs_to :ingredient
  belongs_to :ingredient_type
end
