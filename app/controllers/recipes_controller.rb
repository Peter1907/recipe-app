class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user: current_user)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    Recipe.destroy(params[:id])
    flash[:notice] = 'Recipe deleted'
    redirect_to recipes_path
  end
end
