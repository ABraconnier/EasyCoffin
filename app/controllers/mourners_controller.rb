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
    @mourner = Mourner.find(params[:id])
  end

  def update
    @mourner = Mourner.find(params[:id])
    @mourner.update(mourners_params)
  end

  def mourners_params
    params.require(:mourner).permit(:first_name, :last_name, :account_number, :age, :years_of_expertise, :mourning_intensity, :price_range)
  end
end
