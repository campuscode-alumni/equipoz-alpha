require 'rails_helper'

feature 'user create price per category' do
  scenario 'successfully' do
    category = create(:category, name: 'Betoneira')

    visit new_category_price_path
    select(category.name, :from => 'Categorias')
    select("15", :from => 'Prazo')
    fill_in('Preço', with: '10')

    click_on 'Cadastrar'

    expect(page).to have_content(category.name)
    expect(page).to have_content('15')
    expect(page).to have_content('10')

    find_link('Voltar').visible?
  end
end
