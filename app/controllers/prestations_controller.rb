class PrestationsController < ApplicationController

  def create
    @prestation = Prestation.new(prestation_params)
    mourner = Mourner.find(params[:mourner_id])
    @prestation.mourner = mourner
    @prestation.client = current_client
    authorize @prestation
    @prestation.save
    redirect_to edit_client_path(current_client)
  end

  def show
  end

  def destroy
  end

  private

  def pundit_user
    current_mourner || current_client
  end

  def prestation_params
    params.require(:prestation).permit(:price, :status, :intensity, :review, :location, :date)
  end
end