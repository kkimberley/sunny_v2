# frozen_string_literal: true

# ingredients
class IngredientsController < ApplicationController
  # before_action :require_login

  def index
    @current_page_title = t('nav.ingredient.index')
    @ingredients = Ingredient.includes(:ingredient_type).all
    @ingredient = Ingredient.new
  end

  def create
    ingredient_type = IngredientType.find params[:ingredient][:ingredient_type_id]
    ingredient = ingredient_type.ingredients.new ingredient_params
    ingredient.save

    redirect_to ingredients_path
  end

  def destroy
    ingredient = Ingredient.find params[:id]
    ingredient.destroy

    redirect_to ingredients_path
  end

  def edit
    @ingredient = Ingredient.find params[:id]
    respond_to do |format|
      format.js
      format.html
    end
  end

  def update
    ingredient = Ingredient.find params[:id]
    ingredient.update ingredient_params

    redirect_to ingredients_path
  end

  def return_ingredients
    @ingredient_type = IngredientType.find params[:ingredient_type_id]
    @ingredients = @ingredient_type.ingredients
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:item, :unit)
  end
end
