class ShoppingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipe = Recipe.find(params[:format])
    @total = total_value
  end

  def total_value
    @total_value = 0
    @recipes_foods = RecipesFood.where(recipe_id: params[:format])
    @recipes_foods.each do |item|
      @food = Food.find(item.food_id)
      @total_value += @food.price * item.quantity
    end
    @total_value
  end
end
