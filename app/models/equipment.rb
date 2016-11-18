class Equipment < ApplicationRecord

  validates :serial_number, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :replacement_value, presence: true
  validates :acquisition_date, presence: true
  validates :usage_limit, presence: true
  
end
