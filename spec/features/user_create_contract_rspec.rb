require 'rails_helper'

feature 'User creates Contract' do
  scenario 'successfully' do
    contract = build(:contract)

      visit new_contract_path

      fill_in 'Cliente', with  contract.name
      fill_in 'Endereço de Entrega', with contract.delivery_address
      fill_in 'Prazo de Locação', with contract.rental_period
      fill_in 'Valor Total', with contract.total_amount
      fill_in 'Desconto', with contract.discount
      fill_in 'Equipment', with 'Equipamento 01'
      fill_in 'Resonsável' with contract.contact

      click_on 'Emitir Contrato'

      expect(page).to have_content contract.name
      expect(page).to have_content contract.delivery_address
      expect(page).to have_content contract.rental_period
      expect(page).to have_content contract.total_amount
      expect(page).to have_content contract.discount
      expect(page).to have_content contract.equipment
      expect(page).to have_content contract.contact
      expect(page).to have_content contract.amount



  end
end
