class Ingredient < ApplicationRecord
  default_scope { order(created_at: :desc) }
  has_many :inventories
  belongs_to :ingredient_type
end
