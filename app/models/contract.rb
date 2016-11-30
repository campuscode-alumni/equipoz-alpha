class Contract < ApplicationRecord
  has_one :delivery_receipt
  has_one :delivery_return
  belongs_to :customer
  has_many :rented_equipment
  has_many :equipment, through: :rented_equipment
  before_save :set_total_amount

  # validates_associated :equipment
  validates :customer,
            :equipment,
            :delivery_address,
            :rental_period,
            :contact,
            :equipment,
            :rental_period,
            presence: true

  def set_total_amount
    self.amount = 0
    equipment.each do |equipment|
      current_price = CategoryPrice.where(rental_period: rental_period,
                                          category: equipment.category).last
      self.amount += current_price.price if current_price
    end
    self.total_amount = amount - discount
  end
end
