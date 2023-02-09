class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.where(public: true)
    @recipes_foods = @public_recipes.recipes_foods
  end
end
