require 'rails_helper'

RSpec.describe 'Add ingredient page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Peter', email: 'peter@gmail.com', password: '123456', password_confirmation: '123456')
    @user.confirm
    sign_in @user
    @recipe = Recipe.create(name: 'Pizza', description: 'Delicious pizza made with care!', preparation_time: 30,
                            cooking_time: 30, public: true, user: @user)
    @food = Food.create(name: 'Tomato', price: 1.5, quantity: 1, measurement_unit: 'kg', user: @user)
    @food2 = Food.create(name: 'Cheese', price: 2.5, quantity: 1, measurement_unit: 'kg', user: @user)
    @recipes_food = RecipesFood.create(recipe_id: @recipe.id, food_id: @food.id, quantity: 1)

    visit new_recipes_food_path(@recipe)
  end

  it 'displays the correct title' do
    expect(page).to have_content('Add a New ingredient')
  end

  it 'displays the correct form' do
    expect(page).to have_select
    expect(page).to have_field('Quantity')
    expect(page).to have_button('Add')
    expect(page).to have_link('Cancel')
  end

  it 'can add a new ingredient to the recipe' do
    select(@food2.name, from: 'Food')
    fill_in('Quantity', with: 12)
    click_on 'Add'
    expect(page).to have_content('Ingredient added to recipe')
    expect(page).to have_current_path(recipe_path(@recipe))
  end

  it 'prevents the user from adding the same ingredient twice' do
    select(@food.name, from: 'Food')
    fill_in('Quantity', with: 12)
    click_on 'Add'
    expect(page).to have_content('Ingredient already added to recipe')
    expect(page).to have_current_path(recipe_path(@recipe))
  end
end
