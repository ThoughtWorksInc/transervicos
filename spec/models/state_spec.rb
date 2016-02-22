require 'rails_helper'

RSpec.describe State, type: :model do
  let :state do
    State.new(acronym: 'CE', name: 'Ceará')
  end

  it 'has a two letter acronym' do
    expect(state.acronym).to be_eql('CE')
  end

  it 'has a name' do
    expect(state.name).to be_eql('Ceará')
  end
end
