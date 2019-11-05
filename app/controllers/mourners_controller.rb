class MournersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_mourner!
  skip_before_action :authenticate_mourner!, only: [:index, :show]

  def index
    @mourners = Mourner.all
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :first_name, :last_name, :account_number, :age, :years_of_expertise, :mourning_intensity, :price_range])
  end

  def mourners_params
    params.require(:mourner).permit(:first_name, :last_name, :account_number, :age, :years_of_expertise, :mourning_intensity, :price_range)
  end
end
