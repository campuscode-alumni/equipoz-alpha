require 'rails_helper'

feature 'Users create receipt delivery' do
  scenario "User click on 'Emitir Recibo' visit page delivery receipt" do

    customer = create(:customer)
    equipment = create(:equipment)
    another_equipment = create(:equipment, serial_number: '987654')
    contract = create(:contract, customer: customer,
                      equipment: [equipment, another_equipment])

    full_description = "#{equipment.serial_number} #{equipment.description}"

    visit contract_path(contract)

    click_on 'Emitir Recibo'

    expect(page).to have_css('h1', text: 'Recibo de Entrega')
    expect(page).to have_content contract.contact
    expect(page).to have_content customer.legal_name
    expect(page).to have_content customer.document
    expect(page).to have_content equipment.full_description
    expect(page).to have_content another_equipment.full_description
    expect(page).to have_content contract.rental_period
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content contract.created_at
    expect(page).to have_content contract.number
  end
end
