class Food < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :recipes, join_table: :recipes_foods
end
