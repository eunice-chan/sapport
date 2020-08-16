class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:landing]
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  # TODO: standardize error feedback appearance
  def landing
  end

  protected
  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
   devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
   devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
