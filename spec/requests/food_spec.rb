require 'rails_helper'

RSpec.describe Food, type: :request do
  describe 'Index action' do
    before(:each) do
      @user = User.create(name: 'test', email: 'test@mail.com', password: '123456', password_confirmation: '123456')
      @user.confirm
      @food = Food.create(name: 'rice', measurement_unit: 'Kg', price: 3, quantity: 100, user_id: @user.id)
      sign_in @user
      get foods_path
    end

    it 'has the correct response status' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'renders the view with the correct placeholder text' do
      expect(response.body).to include('Food List')
    end

    it 'renders the view with the new food item' do
      expect(response.body).to include('rice')
    end
  end

  describe 'New action' do
    before(:each) do
      @user = User.create(name: 'test', email: 'test@mail.com', password: '123456', password_confirmation: '123456')
      @user.confirm
      sign_in @user
      get new_food_path
    end

    it 'has the correct response status' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:new)
    end

    it 'renders the view with the correct placeholder text' do
      expect(response.body).to include('Add a New Ingredient')
    end
  end
end
