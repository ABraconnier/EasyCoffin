class MournersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_mourner!
  skip_before_action :authenticate_mourner!, only: [:index, :show]

  def index
    @mourners = policy_scope(Mourner).order(created_at: :desc)
    authorize @mourners
  end

  def show
    @mourner = Mourner.find(params[:id])
    authorize @mourner if current_client
  end

  def edit
    @mourner = Mourner.find(params[:id])
    authorize @mourner if pundit_user == @mourner
  end

  def update
    @mourner = Mourner.find(params[:id])
    authorize @mourner if user == @mourner
    @mourner.update(mourners_params)
    redirect_to edit_mourner_path(@mourner)
  end

  private

  def pundit_user
    current_mourner || current_client
  end

  def mourners_params
    params.require(:mourner).permit(:first_name, :last_name, :account_number, :age, :years_of_expertise, :mourning_intensity, :price_range)
  end
end
