require 'rails_helper'

RSpec.describe Food, type: :model do
  user = User.find_by(name: 'hans')
  subject { Food.create(user:, name: 'rice', measurement_unit: 'Kg', price: 3.0, quantity: 100) }
  before { subject.save }

  it 'name must not be blankcharacters' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'name must not exceed 30 characters' do
    subject.name = 'Rice'
    expect(subject).to be_valid
  end

  it 'measurement_unit must not be blankcharacters' do
    subject.measurement_unit = ''
    expect(subject).to_not be_valid
  end

  it 'measurement_unit must not exceed 10 characters' do
    subject.name = 'liters'
    expect(subject).to be_valid
  end

  it 'price must not be blankcharacters' do
    subject.price = ''
    expect(subject).to_not be_valid
  end

  it 'price must be equal or greater than zero' do
    subject.price = -1
    expect(subject).to_not be_valid
  end

  it 'subject should be an instance of the class Food' do
    expect(subject).to be_instance_of Food
  end
end
