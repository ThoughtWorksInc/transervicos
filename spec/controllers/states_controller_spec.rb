require 'rails_helper'

RSpec.describe StatesController, type: :controller do
  describe 'GET #show' do
    it 'has list of cities with name and id' do
      state = create(:state)
      city = create(:city, state_id: state.id)

      get :show, id: state.id, format: 'json'

      city_json = JSON.parse(response.body)['cities'].first
      expect(city_json['name']).to be_eql(city.name)
      expect(city_json['id']).to be_eql(city.id)
    end
  end
end
