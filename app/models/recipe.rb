class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipes_foods, dependent: :destroy
  has_and_belongs_to_many :foods, join_table: :recipes_foods

  validates :name, presence: true, length: { maximum: 30 }
  validates :description, presence: true, length: { minimum: 20 }
  validates :cooking_time, presence: true, numericality: { greater_than: 0 }
  validates :preparation_time, presence: true, numericality: { greater_than: 0 }
  validates :public, inclusion: { in: [true, false] }

  def total_value(recipe)
    @total_value = 0
    @recipes_foods = RecipesFood.where(recipe_id: recipe)
    @recipes_foods.each do |item|
      @food = Food.find(item.food_id)
      @total_value += @food.price * item.quantity
    end
    @total_value
  end
end
