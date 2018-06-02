class ApplicationController < ActionController::Base
  before_action :authenticate_skier!

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:name, :dob, :level, :image])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:name, :dob, :level, :image])
  end
end
