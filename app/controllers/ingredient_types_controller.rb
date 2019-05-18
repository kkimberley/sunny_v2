class IngredientTypesController < ApplicationController
  def index
    @current_page_title = t('nav.ingredient.new_type')
    @ingredient_type = IngredientType.new
    @ingredient_types = IngredientType.all
  end

  def create
    @ingredient_type = IngredientType.new(ingredient_type_params)
    @ingredient_type.save!
    @ingredient_types = IngredientType.all

    redirect_to ingredient_types_path
  end

  def destroy
    ingredient_type = IngredientType.find params[:id]
    ingredient_type.destroy

    redirect_to ingredient_types_path
  end

  private

  def ingredient_type_params
    params.require(:ingredient_type).permit(:name)
  end
end
