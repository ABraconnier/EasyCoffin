class ApplicationController < ActionController::Base
  def after_sign_in_path_for(user)
    if current_mourner
      edit_mourner_path(user)
    elsif current_client
      edit_client_path(user)
    end
  end

  private

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :account_number, :age, :years_of_expertise, :mourning_intensity, :price_range])
  end
end
