class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipes_foods, dependent: :destroy
  has_and_belongs_to_many :foods, join_table: :recipes_foods

  validates :name, presence: true, length: { maximum: 30 }
  validates :description, presence: true, length: { minimum: 20 }
  validates :cooking_time, presence: true, numericality: { greater_than: 0 }
  validates :preparation_time, presence: true, numericality: { greater_than: 0 }
  validates :public, inclusion: { in: [true, false] }
end
