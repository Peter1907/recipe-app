class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.includes([:user]).where(public: true)
      .or(Recipe.includes([:user]).where(user: current_user)).order(updated_at: :desc)
  end
end
