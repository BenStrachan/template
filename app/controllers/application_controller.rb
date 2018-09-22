class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_business
    @current_business ||= current_user.try(:business)
  end

  protected
    def after_sign_in_path_for(resource)
      request.env['omniauth.origin'] || stored_location_for(resource) || app_dashboards_path
    end
end
