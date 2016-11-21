require 'rails_helper'

feature 'User creates Contract' do
  scenario 'successfully' do

    contract = build(:contract)
    customer = create(:customer, name: 'Campus')
    equipment = create(:equipment, description: 'Furadeira Bosch vermelha')
    another_equipment = create(:equipment, serial_number:'CHK1245', description: 'Betoneira CSM')

    full_description = "#{equipment.serial_number} #{equipment.description}"

    visit new_contract_path

    select customer.name, from: 'Cliente'
    fill_in 'Endereço de Entrega', with: contract.delivery_address
    fill_in 'Prazo de Locação', with: contract.rental_period
    fill_in 'Valor Total', with: contract.total_amount
    fill_in 'Desconto', with: contract.discount
    check(full_description)
    #select full_description, from: 'Equipment'
    fill_in 'Responsável', with: contract.contact

    click_on 'Emitir Contrato'

    expect(page).to have_content customer.name
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content contract.rental_period
    expect(page).to have_content contract.total_amount
    expect(page).to have_content contract.discount
    expect(page).to have_content full_description
    expect(page).to have_content contract.contact
    # expect(page).to have_content contract.amount
  end
end
