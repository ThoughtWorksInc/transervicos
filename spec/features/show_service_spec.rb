require 'rails_helper'

describe 'When user is owner of the service', type: :feature do
  scenario 'user sees edit and delete button' do
    service = create(:service)

    visit new_user_session_path
    fill_in 'email', with: service.user.email
    fill_in 'user_password', with: service.user.password
    click_button 'Entrar'

    visit "/services/#{service.slug}"

    expect(page).to have_link('Editar')
  end
end

describe 'When isn\'t owner of the service', type: :feature do
  scenario 'user doesn\'t see edit and delete button' do
    service = create(:service)
    another_user = create(:user)

    visit new_user_session_path
    fill_in 'email', with: another_user.email
    fill_in 'user_password', with: another_user.password
    click_button 'Entrar'

    visit "/services/#{service.slug}"

    expect(page).to_not have_link('Editar')
  end
end
