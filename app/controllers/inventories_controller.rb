# frozen_string_literal: true

# inventory
class InventoriesController < ApplicationController
  def index
    @inventory = Inventory.new
    @inventories = Inventory.all
  end

  def create
    ingredient = Ingredient.find params[:inventory][:ingredient_id]
    @inventory = ingredient.inventories.new(inventory_params)
    @inventory.save!
    @inventories = Inventory.includes(:ingredient).all

    render 'index'
  end

  private

  def inventory_params
    params.require(:inventory).permit(:price, :number, :datetime, :ingredient_type_id)
  end
end
