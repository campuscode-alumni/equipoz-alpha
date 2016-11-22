require 'rails_helper'

feature 'user list all contract on inital page' do
  scenario 'list all contracts' do

    contract = build(:contract)
    contract.save

    visit root_path

    expect(page).to have_content(contract.customer.name)
    expect(page).to have_content(contract.delivery_address)
    expect(page).to have_content(contract.total_amount)
  end

  scenario 'no contract list' do
    visit root_path

    expect(page).to have_content('Não foi possível encontrar nenhum contrato')
  end

end
