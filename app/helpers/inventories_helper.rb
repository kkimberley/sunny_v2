# frozen_string_literal: true

# helper for inventory
module InventoriesHelper
  def match_symbol(val)
    case val
    when 'add' then '加'
    when 'minus' then '減'
    else '維持'
    end
  end
end
