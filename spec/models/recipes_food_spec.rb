require 'rails_helper'

RSpec.describe RecipesFood, type: :model do
  let(:user) { User.create(name: 'test', email: 'test@test.com', password: '123456') }
  let(:recipe) do
    Recipe.create(name: 'test', description: 'test', preparation_time: 10, cooking_time: 10, public: true,
                  user_id: user.id)
  end
  let(:food) { Food.create(name: 'test', measurement_unit: 'kg', price: 10, quantity: 10, user_id: user.id) }
  let(:recipes_food) { RecipesFood.create(recipe_id: recipe.id, food_id: food.id, quantity: 10) }

  it 'subject should be an instance of the class Food' do
    expect(subject).to be_instance_of RecipesFood
  end
end
