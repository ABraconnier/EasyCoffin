class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :location, :profile_picture, :account_number])
=======
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :first_name, :last_name, :account_number, :age, :years_of_expertise, :mourning_intensity, :price_range])

end
