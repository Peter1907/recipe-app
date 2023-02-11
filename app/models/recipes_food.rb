class RecipesFood < ApplicationRecord
  has_many :foods
  has_many :recipes
end
