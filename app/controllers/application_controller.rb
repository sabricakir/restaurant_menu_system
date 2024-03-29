class ApplicationController < ActionController::Base
  include TurboHelper
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :surname, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :name, :phone, :surname, :email, :password, :password_confirmation])
  end

  def after_sign_in_path_for(resource)
     user_path(current_user)
  end

end
