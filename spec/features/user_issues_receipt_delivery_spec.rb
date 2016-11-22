require 'rails_helper'

feature 'Users issues receipt delivery' do
  scenario 'sucessfully' do

    contract = build(:contract)
    customer = create(:customer, name: 'Campus')
    equipment = build(:equipment)
    equipment = create(:equipment)

    full_description = "#{equipment.serial_number} #{equipment.description}"

    visit contract_path contract

    click_on 'Emitir Contrato'

    visit receipt_path receipt

    expect(page).to have_css('h1', text: 'Recibo de Entrega')
    expect(page).to have_content customer.name
    expect(page).to have_content customer.legal_name
    expect(page).to have_content customer.document
    expect(page).to have_content full_description
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content full_description
    expect(page).to have_content customer.created_at
    expect(page).to have_content contract_id
  end
end
