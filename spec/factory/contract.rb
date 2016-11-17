FactoryGirl.define do
  factory :contract do
    customer 'João Auler'
    delivery_address 'Rua Funchal, 400'
    rental_period '10D'
    discount '1'
    amount '100'
    paryment_method 'a vista'
    contact 'José Lourenço'
  end
end
