class Contract < ApplicationRecord
  belongs_to :customer
  has_many :rented_equipment
  has_many :equipment, through: :rented_equipment

  validates :equipment, presence: true
end
