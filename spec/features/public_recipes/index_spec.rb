require 'rails_helper'

RSpec.describe 'Public Recipe Page', type: :feature do
  before :each do
    @user = User.create(name: 'test', email: 'test@mail.com', password: '123456', password_confirmation: '123456')
    @user.confirm
    sign_in @user
    @recipe = Recipe.create(name: 'Pizza', description: 'Delicious pizza made with care!', preparation_time: 30,
                            cooking_time: 30, public: true, user: @user)

    visit public_recipes_path
  end

  it 'displays the title' do
    expect(page).to have_content('Public Recipes')
  end

  it 'displays the pizza recipe created' do
    expect(page).to have_content('Pizza')
  end

  it 'can redirect to the recipe details page' do
    click_on 'Recipe Name: Pizza'
    expect(page).to have_content('Preparation time:')
    expect(page).to have_content(@recipe.name)
    expect(page).to have_content(@recipe.description)
  end
end
