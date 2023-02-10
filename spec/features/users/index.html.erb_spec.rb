require 'rails_helper'

RSpec.describe 'User Index', type: :feature do
  before :each do
    @user = User.create(name: 'test', email: 'test@mail.com', password: '123456', password_confirmation: '123456')
    @user.confirm

    visit users_path
  end

  it 'shows the right content' do
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user.email)
  end

  # it "When I click on a user, I am redirected to that user's show page" do
  #   find(@user1_url).click
  #   expect(page).to have_content('Systems Engineering Student')
  # end

  # it "When I click on a user, I am redirected to that user's show page" do
  #   find(@user2_url).click
  #   expect(page).to have_content('Law Student')
  # end
end
