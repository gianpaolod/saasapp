class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
#  before_filter :mailer_set_url_options
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # Whitelist the following form fields so that we can process them, if coming from a Devise sing up form.
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:stripe_card_token, :email, :password, :password_confirmation) }
    end
  
#  private
#    def mailer_set_url_options
#      ActionMailer::Base.default_url_options[:host] = request.host_with_port
#    end
end
