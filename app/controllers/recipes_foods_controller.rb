class RecipesFoodsController < ApplicationController
  def new
    @foods = Food.where(user: current_user)
    @recipes_food = RecipesFood.new
  end

  def create
    recipes_food = RecipesFood.new()
    recipes_food.recipe_id = params[:recipes_food][:recipe_id]
    recipes_food.food_id = params[:recipes_food][:food]
    recipes_food.quantity = params[:recipes_food][:quantity]
    if recipes_food.save
      flash[:notice] = 'Ingredient added to recipe'
      redirect_to recipe_path(recipes_food.recipe_id)
    else
      flash.now[:alert] = 'Ingredient couldn\'t be added to recipe'
      render :new
    end
  end
end
