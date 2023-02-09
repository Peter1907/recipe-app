class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.includes([:user]).where(public: true).order(updated_at: :desc)
  end
end
