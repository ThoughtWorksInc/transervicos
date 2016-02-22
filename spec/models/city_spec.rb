require 'rails_helper'

RSpec.describe City, type: :model do
  let :state do
    State.new(acronym: 'CE', name: 'Ceará')
  end

  let :city do
    City.new(name: 'Fortaleza', state: state)
  end

  it 'has a name' do
    expect(city.name).to be_eql('Fortaleza')
  end

  it 'has a state' do
    expect(city.state).to be_eql(state)
  end
end
