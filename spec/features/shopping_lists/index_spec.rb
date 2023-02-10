require 'rails_helper'

RSpec.describe 'Shopping List', type: :feature do
  before(:each) do
    @user = User.create(name: 'Peter', email: 'peter@gmail.com', password: '123456', password_confirmation: '123456')
    @user.confirm
    sign_in @user
    @recipe = Recipe.create(name: 'Pizza', description: 'Delicious pizza made with care!', preparation_time: 30,
                            cooking_time: 30, public: true, user: @user)
    @food = Food.create(name: 'Tomato', price: 1.5, quantity: 1, measurement_unit: 'kg', user: @user)
    @food2 = Food.create(name: 'Cheese', price: 2.5, quantity: 1, measurement_unit: 'kg', user: @user)
    @recipes_food = RecipesFood.create(recipe_id: @recipe.id, food_id: @food.id, quantity: 1)
    @recipes_food2 = RecipesFood.create(recipe_id: @recipe.id, food_id: @food2.id, quantity: 1)

    visit shopping_lists_path(@recipe)
  end

  it 'displays the correct title' do
    expect(page).to have_content("#{@recipe.name} Shopping List")
  end

  it 'displays the shopping list\'s details' do
    expect(page).to have_content('Amount of food items to buy: 2')
    expect(page).to have_content('Total value of food needed: $4')
  end

  it 'displays the recipe ingredients' do
    expect(page).to have_content(@food.name)
    expect(page).to have_content(@food2.name)
  end

  it 'displays a link to go back to the recipe' do
    expect(page).to have_content('Back')
  end

  it 'can redirect to the recipe page' do
    click_on 'Back'
    expect(page).to have_current_path(recipe_path(@recipe))
  end
end
