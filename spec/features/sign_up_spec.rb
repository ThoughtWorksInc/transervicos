require 'rails_helper'

describe 'When user enter valid informations', type: :feature do
  let(:user) { build(:user, name_preference: 'name') }

  scenario 'user signs in successfully' do
    visit new_user_registration_path

    fill_in 'user_social_name', with: user.social_name
    fill_in 'user_birth_date', with: user.birth_date
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password_confirmation
    fill_in 'user_email', with: user.email
    check 'user_terms_of_service'

    click_button 'Cadastrar'

    user_from_db = User.first

    expect(user_from_db.preferred_name).to eq user.social_name
    expect(page).to have_text("Olá, #{user.preferred_name}")
  end
end

describe 'When user doesn\'t enter valid informations', type: :feature do
  let(:user) { build(:user, birth_date: 18.years.ago) }

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
end
