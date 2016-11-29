class CategoryPrice < ApplicationRecord
  belongs_to :category

  validates :category_id, presence: true
  validates :price, presence: true
  validates :rental_period, presence: true
end
