class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def load_subareas
    area = Area.find(params[:area_id])
	  respond_to do |format|
	    format.json { render :json => area.subareas }
	  end
	end

  protected

  def layout_by_resource
    if devise_controller?
      "auth"
    else
      "application"
    end
  end
end
