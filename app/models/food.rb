class Food < ApplicationRecord
  belongs_to :user
  has_many :recipes_foods, dependent: :destroy
  has_and_belongs_to_many :recipes, join_table: :recipes_foods

  validates :name, presence: true, length: { maximum: 30 }
  validates :measurement_unit, presence: true, length: { maximum: 10 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
