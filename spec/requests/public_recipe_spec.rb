require 'rails_helper'

RSpec.describe 'Public Recipes', type: :request do
  describe 'Index action' do
    before(:each) do
      @user = User.create(name: 'test', email: 'test@mail.com', password: '123456', password_confirmation: '123456')
      @user.confirm
      sign_in @user
      get public_recipes_path
    end

    it 'has the correct response status' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'renders the view with the correct placeholder text' do
      expect(response.body).to include('Public Recipes')
    end
  end
end
