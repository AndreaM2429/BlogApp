class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
     before_action :configure_permitted_parameters, if: :devise_controller?
     def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :bio])
    end
    def configure_devise_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user| 
        user.permit(:name, :bio, :email, :password, :password_confirmation)
      end
end
