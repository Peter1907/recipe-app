require 'rails_helper'

RSpec.describe 'Recipe index page', type: :feature do
  before :each do
    @user = User.create(name: 'Peter', email: 'peter@gmail.com', password: '123456', password_confirmation: '123456')
    @user.confirm
    sign_in @user
    @recipe = Recipe.create(name: 'Pizza', description: 'Delicious pizza made with care!', preparation_time: 30,
                            cooking_time: 30, public: true, user: @user)

    visit recipes_path
  end

  it 'displays the title' do
    expect(page).to have_content('Recipes')
  end

  it 'displays the new recipe button' do
    expect(page).to have_content('New Recipe')
  end

  it 'can redirect to the new recipe page' do
    click_on 'New Recipe'
    expect(page).to have_current_path(new_recipe_path)
  end

  it 'displays the each recipe basic details' do
    expect(page).to have_content(@recipe.name)
    expect(page).to have_content(@recipe.description)
  end

  it 'can redirect to the recipe show page' do
    click_link(@recipe.name)
    expect(page).to have_current_path(recipe_path(@recipe))
  end

  it 'displays a link to delete a recipe' do
    expect(page).to have_content('Delete')
  end

  it 'can delete a recipe when clicking the "Delete" link' do
    click_on 'Delete'
    expect(page).not_to have_content(@recipe.name)
    expect(page).to have_content('Recipe deleted')
  end
end
