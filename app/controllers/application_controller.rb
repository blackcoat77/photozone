class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    # Strong parameters for devise go below
    before_action :configure_permitted_parameters, if: :devise_controller?

    # After user sign in send him/her to my profile dashboard
    def after_sign_in_path_for(_resource)
        dashboard_index_url
    end

    protected

    # Devise permitted parameters
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :current_password, :is_female, :date_of_birth])
    end
end
