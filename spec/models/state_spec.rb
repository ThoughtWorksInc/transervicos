require 'rails_helper'

RSpec.describe State, type: :model do
  let(:state) { create(:state, acronym: 'CE', name: 'Ceará') }

  it 'has a two letter acronym' do
    expect(state.acronym).to be_eql('CE')
  end

  it 'has a name' do
    expect(state.name).to be_eql('Ceará')
  end

  it 'has a list of cities' do
    city = create(:city, name: 'Fortaleza', state_id: state.id)
    expect(state.cities.first).to be_eql(city)
  end
end
