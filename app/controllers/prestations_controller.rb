class PrestationsController < ApplicationController

  def create
    @prestation = Prestation.new(prestation_params)
    mourner = Mourner.find(params[:mourner_id])
    @prestation.mourner = mourner
    @prestation.client = current_client
    @prestation.price = mourner.price_range
    @prestation.intensity = mourner.mourning_intensity
    authorize @prestation
    @prestation.save
    redirect_to edit_client_path(current_client)
  end

  def show
  end

  def destroy
    @prestation = Prestation.find(params[:id])
    mourner = Mourner.find(params[:mourner_id])
    @prestation.mourner = mourner
    @prestation.client = current_client
    authorize @prestation
    if @prestation.destroy
      respond_to do |format|
        format.html { redirect_to edit_client_path(current_client) } if current_client
        format.html { redirect_to edit_mourner_path(current_mourner) } if current_client
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'clients/edit' } if current_client
        format.html { render 'mourners/edit' } if current_mourner
        format.js  # <-- idem
      end
    end
  end

  def update
    @prestation = Prestation.find(params[:id])
    authorize @prestation
    @prestation.update(status: 1)
    redirect_to edit_mourner_path(current_mourner)
  end

  private

  def pundit_user
    current_mourner || current_client
  end

  def prestation_params
    params.require(:prestation).permit(:price, :status, :intensity, :review, :location, :date)
  end
end
