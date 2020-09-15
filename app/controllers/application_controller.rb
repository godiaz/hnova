class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:subscribe])

    # For additional in app/views/devise/registrations/edit.html.erb
    #testing commet
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :image])
  end
end
