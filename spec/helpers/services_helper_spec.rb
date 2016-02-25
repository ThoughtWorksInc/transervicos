require 'rails_helper'

RSpec.describe ServicesHelper, type: :helper do
  it 'gets states ordered by name' do
    state_c = FactoryGirl.create(:state, name: 'Ceará', acronym: 'CE')
    state_a = FactoryGirl.create(:state, name: 'Amazonas', acronym: 'AM')
    state_b = FactoryGirl.create(:state, name: 'Bahia', acronym: 'BA')

    expected_states = [state_a, state_b, state_c]
    expect(states_selector.map(&:name)).to be_eql(expected_states.map(&:name))
  end
end
