FactoryGirl.define do
  factory :contract do
    customer "João Auler"
    delivery_address "Rua Funchal"
    rental_period "10D"
    total_amount "100"
    discount "10"
    contact "Moacir Otranto"
  end
end
