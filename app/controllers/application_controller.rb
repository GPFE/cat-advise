class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_user!

    protected

  def configure_permitted_parameters
    # Permit username, email, password, and password_confirmation
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
  end
end
