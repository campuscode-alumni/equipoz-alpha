require 'rails_helper'

RSpec.describe Contract, type: :model do
  before do
    @contract = Contract.new(delivery_address: 'Rua Funchal',
                             rental_period: 3,
                             amount: 110,
                             total_amount: 100,
                             discount: 10,
                             contact: 'Moacir Otranto')
  end

  context 'calculate total contract' do
    it '#total_contract' do
      total_contract = @contract.amount - @contract.discount
      expect(@contract.total_amount).to be total_contract
    end
  end

  context 'equipment unavailable to be rented' do
    
  end
end
