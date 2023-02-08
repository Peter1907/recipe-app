class Recipe < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :foods, join_table: :recipes_foods
end
