class MournersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_mourner!
  skip_before_action :authenticate_mourner!, only: [:index, :show]

  def index
    if params[:location].present? || params[:price].present?
      mourners_location = policy_scope(Mourner).search_by_location(params[:location]).order(created_at: :desc)
      mourners_price = policy_scope(Mourner).search_by_price(params[:price]).order(created_at: :desc)
      @mourners = mourners_location + mourners_price
    else
      @mourners = policy_scope(Mourner).order(created_at: :desc)
    end
    authorize @mourners
  end

  def show
    @mourner = Mourner.find(params[:id])
    @prestation = Prestation.new
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
    params.require(:mourner).permit(:first_name, :last_name, :account_number, :age, :years_of_expertise, :mourning_intensity, :price_range, :photo)
  end
end
