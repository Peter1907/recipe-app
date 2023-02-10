require 'rails_helper'

RSpec.describe 'Shopping List', type: :request do
  before(:each) do
    @user = User.create(name: 'Tom', email: 'tom@gmail.com', password: '123456', password_confirmation: '123456')
    @user.confirm
    sign_in @user
    @recipe = Recipe.create(name: 'Pizza recipe', description: 'we need a description that is longer than 20 chars',
      preparation_time: 10, cooking_time: 10, public: true, user: @user)
  end


  describe 'Index action' do
    before(:each) { get shopping_lists_path(@recipe.id) }
    
    it 'has the correct response status' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'renders the view with the correct placeholder text' do
      expect(response.body).to include('Shopping List')
    end
  end
end
