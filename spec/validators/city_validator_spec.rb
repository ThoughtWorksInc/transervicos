require 'rails_helper'

RSpec.describe CityValidator, type: :validator do
  let(:errors) { { city_id: [] } }
  let(:model) do
    model = double('model')
    allow(model).to receive('errors') { errors }
    model
  end

  it 'disallow models with empty city' do
    allow(model).to receive('city_id')

    validator = CityValidator.new
    validator.validate(model)

    expect(errors[:city_id].first).to be_eql(CityValidator::FAIL_MESSAGE)
  end

  it 'disallow models with non-existing city' do
    allow(model).to receive('city_id') { 9999 }

    validator = CityValidator.new
    validator.validate(model)

    expect(errors).to_not be_empty
    expect(errors[:city_id].first).to be_eql(CityValidator::FAIL_MESSAGE)
  end

  it 'allow models with existing city' do
    city = create(:city)
    allow(model).to receive('city_id') { city.id }

    validator = CityValidator.new
    validator.validate(model)

    expect(errors[:city_id]).to be_empty
  end
end
