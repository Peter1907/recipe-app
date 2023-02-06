class Recipe < ApplicationRecord
  belogns_to: :user
  has_many: :foods, through: :recipes_foods
end
