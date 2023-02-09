class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.includes([:user]).where(public: true)
    @recipes_foods = RecipesFood.where(user: current_user)
  end
end
