require 'rails_helper'

RSpec.describe Devise::Mailer, type: :mailer do
  let :user do
    build(:user, social_name: 'social name',
          civil_name: 'civil name',
          name_preference: User::SOCIAL_NAME_PREFERENCE)
  end

  context 'reset password' do
    let :mail do
      user.send_reset_password_instructions
      ActionMailer::Base.deliveries.last
    end

    it 'has no-reply at transervicos in the from field' do
      expect(mail.from.first).to be_eql('no-reply@transervicos.com')
    end

    it 'has transervicos logo in the email body' do
      expect(/<img.*http:\/\/localhost:8000\/assets\/logo-mail\.png.*>/.match(mail.body.encoded)).not_to be_nil
    end
  end
end
