require 'rails_helper'

RSpec.describe 'Food New', type: :feature do
  before :each do
    @user = User.create(name: 'test', email: 'test@mail.com', password: '123456', password_confirmation: '123456')
    @user.confirm
    sign_in @user

    @cancel = "a[href='http://127.0.0.1:3000/foods']"

    visit new_food_path
  end

  it 'shows the right content' do
    expect(page).to have_content('Add a New Ingredient')
  end

  it 'When I click on Add Food, I am redirected to the Food List Page' do
    click_on 'Add Food'
    expect(page).to have_content('Food List')
  end

  # it 'When I click on Cancel, I am redirected to the Food List Page' do
  #   find_link('Cancel').click
  #   expect(page).to have_content('Food List')
  # end
end
