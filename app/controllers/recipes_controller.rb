class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = Recipe.where(user: current_user)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipes_foods = RecipesFood.where(recipe_id: params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      flash[:notice] = 'Recipe created'
      redirect_to recipes_path
    else
      flash[:alert] = @recipe.errors.full_messages.join(', ')
      redirect_to new_recipe_path
    end
  end

  def destroy
    Recipe.destroy(params[:id])
    flash[:notice] = 'Recipe deleted'
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
