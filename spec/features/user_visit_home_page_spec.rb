require 'rails_helper'

feature 'User visit home page' do
  scenario 'and view a menu' do
    visit root_path

    expect(page).to have_link 'Novo Contrato', href: new_contract_path
    expect(page).to have_link 'Ver Contratos', href: contracts_path
    expect(page).to have_link 'Clientes', href: customers_path
    expect(page).to have_link 'Novo Equipamento', href: new_equipment_path
    expect(page).to have_link 'Listar Equipamentos', href: equipment_index_path
    expect(page).to have_link 'Nova Categoria', href: new_category_path
    expect(page).to have_link 'Listar Categorias', href: categories_path
  end
end
