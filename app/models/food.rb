class Food < ApplicationRecord
  belogns_to :user
  has_many :recipes, through: :recipes_foods
end
