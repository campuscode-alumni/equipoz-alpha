require 'rails_helper'

feature 'User visit customers index' do
  scenario 'and view customers link' do
    customer = create(:customer)

    visit customers_path

    expect(page).to have_link 'Novo Cliente', href: new_customer_path
    expect(page).to have_link 'Visualizar', href: customer_path(customer)

  end
  scenario 'and view customers data' do
    customer = create(:customer)

    visit customers_path

    expect(page).to have_content customer.id
    expect(page).to have_content customer.name
    expect(page).to have_content customer.contact_name
    expect(page).to have_content customer.phone_number
    expect(page).to have_content customer.email
    expect(page).to have_content customer.address
  end

  scenario 'and do not view customers data' do

    customer = create(:customer)

    visit customers_path

    expect(page).to have_no_content customer.customer_type
    expect(page).to have_no_content customer.created_at
    expect(page).to have_no_content customer.updated_at
    expect(page).to have_no_content customer.legal_name
  end
end
