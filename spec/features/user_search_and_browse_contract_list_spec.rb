require 'rails_helper'

feature 'user search for contract and browse' do
  scenario 'list all contracts' do

    contract = build(:contract)
    contract.save

    visit search_contracts_path

    click_on 'Buscar Contratos'

    expect(page).to have_content(contract.customer.name)

  end
end
