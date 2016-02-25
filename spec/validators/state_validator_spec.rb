require 'rails_helper'

RSpec.describe StateValidator, type: :validator do
  let(:errors) { { state_id: [] } }
  let(:model) do
    model = double('model')
    allow(model).to receive('errors') { errors }
    model
  end

  it 'disallow models with empty state' do
    allow(model).to receive('state_id')

    validator = StateValidator.new
    validator.validate(model)

    expect(errors[:state_id].first).to be_eql(StateValidator::FAIL_MESSAGE)
  end

  it 'disallow models with non-existing state' do
    allow(model).to receive('state_id') { 9999 }

    validator = StateValidator.new
    validator.validate(model)

    expect(errors).to_not be_empty
    expect(errors[:state_id].first).to be_eql(StateValidator::FAIL_MESSAGE)
  end

  it 'allow models with existing state' do
    state = create(:state)
    allow(model).to receive('state_id') { state.id }

    validator = StateValidator.new
    validator.validate(model)

    expect(errors[:state_id]).to be_empty
  end
end
