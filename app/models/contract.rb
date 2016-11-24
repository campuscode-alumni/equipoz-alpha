class Contract < ApplicationRecord
  belongs_to :customer
  has_many :rented_equipment
  has_many :equipment, through: :rented_equipment
  # validates_associated :equipment
  validates :equipment, presence: true

  def total_contract
    total_amount - discount
  end
end
