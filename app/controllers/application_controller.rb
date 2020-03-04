class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_person_can_edit?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name password password_confirmation current_password])
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:name])
  end

  def current_person_can_edit?(article)
    person_signed_in? && article.person == current_person
  end
end
