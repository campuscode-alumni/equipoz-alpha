require 'rails_helper'

feature 'user issues delivery returns' do
	scenario 'created delivery return' do
		customer = create(:customer)
		equipment = create(:equipment)
		another_equipment = create(:equipment, serial_number: '976413')
		contract = create(:contract,
											customer: customer,
											equipment: [equipment, another_equipment])
		delivery_return = build(:delivery_return, contract: contract)

		full_description = " #{equipment.serial_number} #{equipment.description}"

		visit contract_path(contract)

		click_on 'Recibo Entrega'

		# verificar se foi persistido no banco

		visit contract_path(contract)

		click_on 'Recibo Devolução'

		fill_in 'Nome', with: 'Noronha'
		fill_in 'CPF', with: '840.087.092-15'

		click_on 'Emitir'

		expect(page). to have_content delivery_return.name
		expect(page). to have_content equipment.full_description
		expect(page). to have_content equipment.another_equipment
		expect(page). to have_content equipment.full_description
		expect(page). to have_content contract.number
		expect(page). to have_content contract.legal_number
		expect(page). to have_content customer.document
		expect(page). to have_content delivery_return.created_at
	end
end
