class RecipesFoodsController < ApplicationController
  def new
    @foods = Food.where(user: current_user)
    @recipes_food = RecipesFood.new
  end

  def create
    if RecipesFood.where(food_id: params[:recipes_food][:food_id], recipe_id: params[:recipes_food][:recipe_id]).exists?
      flash[:alert] = 'Ingredient already added to recipe'
      redirect_to recipe_path(params[:recipes_food][:recipe_id])
    else
      recipes_food = RecipesFood.new
      recipes_food.recipe_id = params[:recipes_food][:recipe_id]
      recipes_food.food_id = params[:recipes_food][:food_id]
      recipes_food.quantity = params[:recipes_food][:quantity]
      if recipes_food.save
        flash[:notice] = 'Ingredient added to recipe'
        redirect_to recipe_path(recipes_food.recipe_id)
      else
        flash[:alert] = 'Ingredient couldn\'t be added to recipe'
        render :new
      end
    end
  end

  def destroy
    recipes_food = RecipesFood.find(params[:id])
    recipes_food.destroy
    flash[:notice] = 'Ingredient removed successfully'
    redirect_to recipe_path(recipes_food.recipe_id)
  end
end
