class ReportsController < ApplicationController
  def create
    @report = Report.new(params[:report].permit(:detail, :email, :service_id))
    @report.save
    redirect_to controller: 'services', action: 'index'
  end
end
