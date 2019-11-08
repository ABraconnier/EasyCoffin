class MournersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_mourner!
  skip_before_action :authenticate_mourner!, only: [:index, :show]

  def index
    @mourners = policy_scope(Mourner).order(created_at: :desc)
    if params[:price].present? || params[:location].present?
      params[:price] = (0..params[:price].to_i).to_a.join(" ")
      @mourners = @mourners.search_by_price(params[:price]) if params[:price].present?
      @mourners = @mourners.near(params[:location], 300) if params[:location].present?
    end
    authorize @mourners if @mourners != []
    @mourners_geo = @mourners.geocoded
    @markers = @mourners_geo.map do |mourner|
      {
        lat: mourner.latitude,
        lng: mourner.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { mourner: mourner }),
        image_url: helpers.asset_url('marker_mourner')
      }
    end
  end

  def show
    @mourner = Mourner.find(params[:id])
    @prestation = Prestation.new
    authorize @mourner if current_client
  end

  def edit
    @mourner = Mourner.find(params[:id])
    authorize @mourner if pundit_user == @mourner
    @prestations = @mourner.prestations
  end

  def update
    @mourner = Mourner.find(params[:id])
    authorize @mourner if pundit_user == @mourner
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
