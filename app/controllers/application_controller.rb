class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(_resource)
    dashboard_path
  end

  def load_subareas
    area = Area.find(params[:area_id])
    respond_to do |format|
      format.json { render json: area.subareas }
    end
  end
end
