require 'rails_helper'

RSpec.describe 'User Index', type: :feature do
  before :each do
    @user = User.create(name: 'test', email: 'test@mail.com', password: '123456', password_confirmation: '123456')
    @user.confirm
    sign_in @user

    visit users_path
  end

  it 'shows the right content' do
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user.email)
  end

  it 'When I click on Logout, I am redirected to the Public Recipes' do
    find_button('Logout').click
    expect(page).to have_content('Public Recipes')
  end
end
