class Contract < ApplicationRecord
  belongs_to :customer
  has_many :equipment
end
