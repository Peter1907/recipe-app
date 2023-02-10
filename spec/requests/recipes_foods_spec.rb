require 'rails_helper'

RSpec.describe 'Shopping List', type: :request do
  before(:each) do
    @user = User.create(name: 'Tom', email: 'tom@gmail.com', password: '123456', password_confirmation: '123456')
    @user.confirm
    sign_in @user
    @recipe = Recipe.create(name: 'Pizza recipe', description: 'we need a description that is longer than 20 chars',
                            preparation_time: 10, cooking_time: 10, public: true, user: @user)
    @food = Food.create(name: 'Tomato', price: 10, quantity: 10, measurement_unit: 'kg', user: @user)
    @food2 = Food.create(name: 'Onion', price: 10, quantity: 10, measurement_unit: 'kg', user: @user)

    @recipes_food = RecipesFood.create(recipe_id: @recipe.id, food_id: @food.id, quantity: 10)
    @recipes_food2 = RecipesFood.create(recipe_id: @recipe.id, food_id: @food2.id, quantity: 10)
  end

  describe 'Index action' do
    before(:each) { get shopping_lists_path(@recipe.id) }

    it 'renders the view with the correct info' do
      expect(response.body).to include('Tomato')
      expect(response.body).to include('Onion')
      expect(response.body).to include('Price')
      expect(response.body).to include('Quantity')
      expect(response.body).to include('$200')
      expect(response.body).to_not include('No Ingredients added yet')
    end
  end
end
