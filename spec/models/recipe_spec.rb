require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { User.create(name: 'test', email: 'test@test.com', password: '123456') }
  let(:recipe) { Recipe.create(name: 'test', description: 'test', preparation_time: 10, cooking_time: 10, public: true, user_id: user.id) }
  let(:food) { Food.create(name: 'test', measurement_unit: 'kg', price: 10, quantity: 10, user_id: user.id) }
  let(:recipes_food) { RecipesFood.create(recipe_id: recipe.id, food_id: food.id, quantity: 10) }

  it 'has valid description' do
    recipe.description = 'a' * 50
    expect(recipe).to be_valid
    recipe.description = nil
    expect(recipe).to_not be_valid
    recipe.description = 'a' * 19
    expect(recipe).to_not be_valid
  end

  it 'is not valid without a name' do
    recipe.name = nil
    expect(recipe).to_not be_valid
  end

  it 'is not valid without a preparation time' do
    recipe.preparation_time = nil
    expect(recipe).to_not be_valid
  end

  it 'is not valid without a cooking time' do
    recipe.cooking_time = nil
    expect(recipe).to_not be_valid
  end

  it 'is not valid without a user' do
    recipe.user_id = nil
    expect(recipe).to_not be_valid
  end

  it 'is not valid with a name longer than 30 characters' do
    recipe.name = 'a' * 31
    expect(recipe).to_not be_valid
  end

  it 'is not valid with a preparation time less than 1' do
    recipe.preparation_time = 0
    expect(recipe).to_not be_valid
  end

  it 'is not valid with a cooking time less than 1' do
    recipe.cooking_time = 0
    expect(recipe).to_not be_valid
  end
end
