require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller(ApplicationController) do
    def after_sign_in_path_for(resource)
      super resource
    end
  end

  describe 'After sign-up' do
    it 'redirects to the dashboard page' do
      expect(controller.after_sign_in_path_for(User.new)).to eq(dashboard_path)
    end
  end
end
