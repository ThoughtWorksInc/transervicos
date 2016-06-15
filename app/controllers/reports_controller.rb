class ReportsController < ApplicationController
  def create
    @report = Report.new(params[:report].permit(:detail, :email, :service_id))
    @report.save
    render :new
  end
end
