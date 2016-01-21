require 'rails_helper'

describe 'When user has valid informations', type: :feature do
  let(:user) { create(:user) }

  scenario 'user signs in successfully' do
    visit '/users/sign_in'

    expect(page).to have_text('Entrar no Transerviços')

    fill_in 'email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Entrar'

    expect(page).to have_text("Olá, #{user.preferred_name}")
  end
end

describe 'When user doesn\'t have valid informations', type: :feature do
  let(:user) { create(:user) }

  scenario 'user can\'t sign in' do
    visit '/users/sign_in'

    expect(page).to have_text('Entrar no Transerviços')

    fill_in 'email', with: user.email
    fill_in 'user_password', with: 'incorrectpassword'
    click_button 'Entrar'

    expect(page).to have_text('Endereço de email ou senha invalidos. Tente novamente!')
  end
end
