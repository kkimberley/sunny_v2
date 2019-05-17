# frozen_string_literal: true

# inventory
class Inventory < ApplicationRecord
  belongs_to :ingredient
  belongs_to :ingredient_type

  scope :by_type, lambda { |type_id|
    if type_id.present?
      where(ingredient_type_id: type_id)
    else
      all
    end
  }

  scope :by_id, lambda { |_id|
    if _id.present?
      where(ingredient_id: _id)
    else
      all
    end
  }
end
