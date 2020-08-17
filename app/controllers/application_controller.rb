class ApplicationController < ActionController::Base
    before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :favorite_id, :have_pet_id, :pet_name ])
  end
end
