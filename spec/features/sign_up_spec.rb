require 'rails_helper'

describe 'When user enter valid informations', type: :feature do
  let(:user) { build(:user) }

  scenario 'user signs in successfully' do
    visit new_user_registration_path

    fill_in 'user_social_name', with: user.social_name
    fill_in 'user_civil_name', with: user.civil_name
    fill_in 'user_birth_date', with: user.birth_date
    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password_confirmation
    fill_in 'user_phone_number', with: user.phone_number
    fill_in 'user_email', with: user.email
    check 'user_terms_of_service'

    click_button 'Cadastrar'

    expect(page).to have_text("Olá, #{user.social_name}")
  end
end

describe 'When user doesn\'t enter valid informations', type: :feature do
  let(:user) { build(:user, username: 'username', birth_date: 16.years.ago) }

  scenario 'user doesn\'t fill any name' do
    visit new_user_registration_path

    click_button 'Cadastrar'

    expect(page).to have_text('É preciso informar ao menos um nome.')
  end

  scenario 'user has less than 18 years old' do
    visit new_user_registration_path

    fill_in 'user_birth_date', with: user.birth_date
    click_button 'Cadastrar'

    expect(page).to have_text('É preciso ser maior de idade')
  end

  scenario 'username is already in database' do
    create(:user, username: 'username')

    visit new_user_registration_path

    fill_in 'user_username', with: user.username
    click_button 'Cadastrar'

    expect(page).to have_text('Username já está em uso')
  end
end
