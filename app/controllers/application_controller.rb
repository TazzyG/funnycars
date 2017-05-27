class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def set_mailer_host
    # Will this work with new user registration? Test
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit( :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params| 
      user_params.permit( :password, :password_confirmation)
    end
  end
end
