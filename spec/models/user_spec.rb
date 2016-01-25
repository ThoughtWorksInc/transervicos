require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#preferred_name' do
    context 'the name of preference is the social' do
      let :user do
        build(:user, social_name: 'social name',
                     civil_name: 'civil name',
                     name_preference: User::SOCIAL_NAME_PREFERENCE)
      end

      it 'returns the social_name' do
        expect(user.preferred_name).to be_eql('social name')
      end

      it 'returns civil name when social name is empty' do
        user.social_name = nil
        expect(user.preferred_name).to be_eql('civil name')
      end
    end

    context 'the name of preference is the civil' do
      let :user do
        build(:user, social_name: 'social name',
                     civil_name: 'civil name',
                     name_preference: User::CIVIL_NAME_PREFERENCE)
      end

      it 'returns the civil_name' do
        expect(user.preferred_name).to be_eql('civil name')
      end

      it 'returns social name when civil name is empty' do
        user.civil_name = nil
        expect(user.preferred_name).to be_eql('social name')
      end
    end
  end

  context 'with invalid attributes' do
    let(:user) { build(:user, username: nil) }

    it 'does not save user without username' do
      expect(user).to be_invalid
    end
  end
end
