class ReportsController < ApplicationController
  before_action :authenticate_user!, only: [:find_reports_by_service]

  def create
    @report = Report.new(params[:report].permit(:detail, :email, :service_id))
    @report.save
    redirect_to controller: 'services', action: 'index'
  end

  def find_reports_by_service
    @reports = Report.get_by_service(params[:service_id])
    @service = Service.find(params[:service_id])
    render :index
  end
end
