require 'rails_helper'

RSpec.describe 'Recipe show page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Peter', email: 'peter@gmail.com', password: '123456', password_confirmation: '123456')
    @user.confirm
    sign_in @user
    @recipe = Recipe.create(name: 'Pizza', description: 'Delicious pizza made with care!', preparation_time: 30,
                            cooking_time: 30, public: true, user: @user)
    @food = Food.create(name: 'Tomato', price: 1.5, quantity: 1, measurement_unit: 'kg', user: @user)
    @food2 = Food.create(name: 'Cheese', price: 2.5, quantity: 1, measurement_unit: 'kg', user: @user)
    @recipes_food = RecipesFood.create(recipe_id: @recipe.id, food_id: @food.id, quantity: 1)

    visit recipe_path(@recipe)
  end

  it 'displays the correct title' do
    expect(page).to have_content("#{@recipe.name} Recipe")
  end

  it 'displays the recipe detailed info' do
    expect(page).to have_content(@recipe.description)
    expect(page).to have_content(@recipe.preparation_time)
    expect(page).to have_content(@recipe.cooking_time)
    expect(page).to have_content('Public')
  end

  it 'displays the recipe ingredients' do
    expect(page).to have_content(@food.name)
  end

  it 'displays a link to make a shopping list' do
    expect(page).to have_content('Generate Shopping List')
  end

  it 'can redirect to the shopping list page' do
    click_on 'Generate Shopping List'
    expect(page).to have_current_path(shopping_lists_path(@recipe))
  end

  it 'displays a link to add an ingredient to the recipe' do
    expect(page).to have_content('Add Ingredient')
  end

  it 'can redirect to the page to add an ingredient' do
    click_on 'Add Ingredient'
    expect(page).to have_current_path(new_recipes_food_path(@recipe))
  end

  it 'displays links to remove ingredients' do
    expect(page).to have_button('Remove')
  end

  it 'can remove an ingredient from the recipe' do
    click_on('Remove')
    expect(page).not_to have_content(@food.name)
    expect(page).to have_content('Ingredient removed successfully')
    expect(page).to have_current_path(recipe_path(@recipe))
  end
end
