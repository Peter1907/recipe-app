require 'rails_helper'

RSpec.describe Recipe, type: :request do

  describe 'Index action' do
    before(:each) do
      @user = User.create(name: 'Tom', email: 'tom@gmail.com', password: '123456', password_confirmation: '123456')
      @user.confirm
      sign_in @user
      get recipes_path
    end

    it 'has the correct response status' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'renders the view with the correct placeholder text' do
      expect(response.body).to include('Recipes')
    end
  end

  describe 'Show action' do
    before(:each) do
      @user = User.create(name: 'Tom', email: 'tom@gmail.com', password: '123456', password_confirmation: '123456')
      @user.confirm
      sign_in @user
      @recipe = Recipe.create(name: 'test', description: 'test', preparation_time: 10, cooking_time: 10, public: true, user: @user)     
      get recipe_path(@recipe)
    end

    it 'has the correct response status' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end
  end
end
