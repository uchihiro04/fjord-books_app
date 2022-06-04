# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters , if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :post_code, :address, :self_introduction])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :post_code, :address, :self_introduction])
  end

end
