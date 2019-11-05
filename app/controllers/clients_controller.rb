class ClientsController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_client!
  skip_before_action :authenticate_client!, only: [:edit, :update]
  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :location, :profile_picture, :account_number])
  end
end
