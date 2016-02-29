require 'rails_helper'

RSpec.describe ServicesHelper, type: :helper do
  it 'gets states ordered by name' do
    state_c = FactoryGirl.create(:state, name: 'Ceará', acronym: 'CE')
    state_a = FactoryGirl.create(:state, name: 'Amazonas', acronym: 'AM')
    state_b = FactoryGirl.create(:state, name: 'Bahia', acronym: 'BA')

    expected_states = [state_a, state_b, state_c]
    expect(states_selector.map(&:name)).to be_eql(expected_states.map(&:name))
  end

  context '#should display owner data' do
    it 'has data if owner name is present' do
      service = create(:service, owner_name: 'Jose')
      expect(should_display_owner_data(service)).to be_truthy
    end

    it 'does not have data if owner name is not present' do
      service = create(:service, owner_name: nil)
      expect(should_display_owner_data(service)).to be_falsey
    end
  end
end
