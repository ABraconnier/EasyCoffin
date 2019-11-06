class MournersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_mourner!
  skip_before_action :authenticate_mourner!, only: [:index, :show]

  def index
    @mourners = Mourner.all
  end

  def show
    @mourner = Mourner.find(params[:id])
    @prestation = Prestation.new
  end

  def edit
    @mourner = Mourner.find(params[:id])
  end

  def update
    @mourner = Mourner.find(params[:id])
    @mourner.update(mourners_params)
    redirect_to edit_mourner_path(@mourner)
  end

  private

  def mourners_params
    params.require(:mourner).permit(:first_name, :last_name, :account_number, :age, :years_of_expertise, :mourning_intensity, :price_range)
  end
end
