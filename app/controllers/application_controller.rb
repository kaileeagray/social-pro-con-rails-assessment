class ApplicationController < ActionController::Base

  include ActionController::Serialization

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  include SessionsHelper

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
