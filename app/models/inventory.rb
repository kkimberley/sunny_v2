# frozen_string_literal: true

# inventory
class Inventory < ApplicationRecord
  belongs_to :ingredient
  belongs_to :ingredient_type

  scope :from_year, ->(date) { where(datetime: date.beginning_of_year..date.end_of_year).order(price: :desc) }
  scope :from_last_three_months, ->(date) { where(datetime: 2.months.ago.beginning_of_month..date.end_of_month).order(price: :desc) }

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
