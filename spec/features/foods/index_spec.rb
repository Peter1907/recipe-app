require 'rails_helper'

RSpec.describe 'Food Index', type: :feature do
  before :each do
    @user = User.create(name: 'test', email: 'test@mail.com', password: '123456', password_confirmation: '123456')
    @user.confirm
    sign_in @user

    @addfood = "a[href='/foods/new']"

    visit foods_path
  end

  it 'shows the right content' do
    expect(page).to have_content('Food List')
  end

  it 'When I click on Add Food, I am redirected to the Food Creation form' do
    find(@addfood.to_s).click
    expect(page).to have_content('Add a New Ingredient')
  end
end
