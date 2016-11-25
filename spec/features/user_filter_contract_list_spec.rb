require 'rails_helper'

feature 'user filter contract list' do
  scenario 'no filters' do
    customer1 = create(:customer)
    equipment1 = create(:equipment)
    contract1 = create(:contract, customer: customer1, equipment: [equipment1])

    customer2 = create(:customer, name: 'Cliente 2')
    equipment2 = create(:equipment, description: 'descriçao 2')
    contract2 = create(:contract, customer: customer2, equipment: [equipment2])
    visit root_path

    expect(page).to have_content(contract1.customer.name)
    expect(page).to have_content(contract1.delivery_address)
    expect(page).to have_content(contract1.total_amount)

    expect(page).to have_content(contract2.customer.name)
    expect(page).to have_content(contract2.delivery_address)
    expect(page).to have_content(contract2.total_amount)
  end

  scenario 'filter customer1' do
    customer1 = create(:customer)
    equipment1 = create(:equipment)
    contract1 = create(:contract, customer: customer1, equipment: [equipment1])

    customer2 = create(:customer, name: 'Cliente 2')
    equipment2 = create(:equipment, description: 'descriçao 2')
    contract2 = create(:contract, customer: customer2, equipment: [equipment2])
    visit root_path

    select customer1.name, from: 'Cliente'

    expect(page).to have_content(contract1.customer.name)
    expect(page).to have_content(contract1.delivery_address)
    expect(page).to have_content(contract1.total_amount)

    expect(page).not_to have_content(contract2.customer.name)
    expect(page).not_to have_content(contract2.delivery_address)
    expect(page).not_to have_content(contract2.total_amount)
  end

end
