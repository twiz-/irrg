class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protected
  
  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      dashboard_show_path 
    elsif resource.is_a?(AdminUser)
      admin_dashboard_path(resource)
    end
  end  
end
