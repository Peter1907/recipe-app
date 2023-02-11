require 'rails_helper'

RSpec.describe 'Foods', type: :system, js: true do
  describe 'index page' do
    before(:example) do
      @user = User.create(name: 'test', email: 'test@mail.com', password: '123456')
      sign_in @user

      @food = Food.create(user: @user, name: 'Cheese', measurement_unit: 'kg', quantity: 1, price: 10)
      visit foods_path
    end

    # it 'renders correct name of food' do
    #   expect(page).to have_content(@food.name)
    # end

    # it 'renders measurement_unit of the food' do
    #   expect(page).to have_content(@test_food.measurement_unit)
    # end

    # it 'renders correct price of the food' do
    #   expect(page).to have_content(@test_food.price)
    # end

    # it 'redirects to delete path' do
    #   click_button 'Delete'
    #   expect(page).to have_current_path(foods_path)
    # end

    # it 'renders a button with text Add Food' do
    #   expect(page).to have_content('Add Food')
    # end

    # it 'redirects to correct path' do
    #   click_link 'Add Food'
    #   expect(page).to have_current_path(new_food_path)
    # end
  end
end
