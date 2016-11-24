feature "User create receipt return"do
  scenario "on created" do
    customer = create(:customer)
    equipment = create(:equipment)
    another_equipment = create(:equipment, serial_number: '987654')
    contract = create(:contract, customer: customer,
                      equipment: [equipment, another_equipment],
                      delivery_return: delivery_return)
    delivery_return = build(:delivery_return, name)

    full_description = "#{equipment.serial_number} #{equipment.description}"

    visit contract_path(contract)

    click_on 'Recibo de Devolução'

    fill_in 'Nome', with: delivery_return.name
    fill_in 'CPF', with: delivery_return.document

    click_on 'Emitir'

    expect(page).to have_css('h1', text: 'Recibo de Devolução')
    expect(page).to have_content delivery_return.name
    expect(page).to have_content delivery_return.document
    expect(page).to have_content equipment.full_description
    expect(page).to have_content another_equipment.full_description
    expect(page).to have_content contract.number
    expect(page).to have_content customer.legal_name
    expect(page).to have_content customer.document
    expect(page).to have_content delivery_created_at
  end
end
