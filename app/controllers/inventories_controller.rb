# frozen_string_literal: true

# inventory
class InventoriesController < ApplicationController
  def index
    @current_page_title = t('nav.ingredient.inventory')
    @inventory = Inventory.new
    @inventories = Inventory.all.order(created_at: :desc).page(params[:page]).per(7)
    @date_of_this_year = Inventory.from_year(Date.current)
    @top_of_this_year = @date_of_this_year.first
    @date_of_last_three_months = Inventory.from_last_three_months(Date.current)
    @top_of_last_three_months = @date_of_last_three_months.first
  end

  def create
    ingredient = Ingredient.find params[:inventory][:ingredient_id]
    @inventory = ingredient.inventories.new(inventory_params)
    @inventory.save!
    @inventories = Inventory.includes(:ingredient).all

    redirect_to inventories_path
  end

  def report
    @current_page_title = t('nav.ingredient.report')
    return unless params[:inventory]

    @ingredient_type_id = params[:inventory][:ingredient_type_id]
    @ingredient_id = params[:inventory][:ingredient_id]
    @inventories = Inventory.by_type(@ingredient_type_id).by_id(@ingredient_id)
    @inventories_sum = @inventories.sum('price * number')

    respond_to do |format|
      format.js
      format.html
      format.xlsx { render @inventories }
    end
  end

  def quick_report_by_type
    @group_type = Inventory.all.group_by(&:ingredient_type_id)
    @group_inventories = Inventory.all.group_by { |e| [e.ingredient_type_id, e.ingredient_id] }
  end

  def quick_report_by_month
    @group_type = Inventory.all.group_by { |m| m.datetime.beginning_of_month }
    @group_inventories = Inventory.all.group_by { |m| [m.datetime.beginning_of_month, m.ingredient_type_id] }
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
