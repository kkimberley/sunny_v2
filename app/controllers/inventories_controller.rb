# frozen_string_literal: true

# inventory
class InventoriesController < ApplicationController
  def index
    @inventory = Inventory.new
    @inventories = Inventory.all.order(created_at: :desc).page(params[:page]).per(7)
  end

  def create
    ingredient = Ingredient.find params[:inventory][:ingredient_id]
    @inventory = ingredient.inventories.new(inventory_params)
    @inventory.save!
    @inventories = Inventory.includes(:ingredient).all

    redirect_to inventories_path
  end

  def report
    return unless params[:inventory]

    @ingredient_type_id = params[:inventory][:ingredient_type_id]
    @ingredient_id = params[:inventory][:ingredient_id]
    @inventories = Inventory.by_type(@ingredient_type_id).by_id(@ingredient_id)
    @inventories_sum = @inventories.sum('price * number')

    respond_to do |format|
      format.js
      format.html
      format.xls { render @inventories }
    end
  end

  def quick_report
    @group_field = params[:by]
    @group_inventories = if @group_field == 'type'
                           Inventory.all.group_by(&:ingredient_type_id)
                         else
                           # group_by year and month
                           Inventory.all.group_by { |m| m.datetime.beginning_of_month }
                         end
  end

  def destroy
    inventory = Inventory.find params[:id]
    inventory.destroy

    redirect_to inventories_path
  end

  private

  def inventory_params
    params.require(:inventory).permit(:price, :number, :datetime, :ingredient_type_id)
  end
end
