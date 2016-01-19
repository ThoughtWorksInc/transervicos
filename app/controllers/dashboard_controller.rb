class DashboardController < ApplicationController
  def index
    @services = current_user.services
  end
end
