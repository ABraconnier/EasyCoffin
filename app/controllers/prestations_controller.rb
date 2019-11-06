class PrestationsController < ApplicationController

  def index
  end

  def new
    @prestation = Prestation.new
  end

  def create
    Prestation.create(prestation_params)
  end

  def show
  end

  def destroy
  end

  private

  def prestation_params
    params.require(:prestation).permit(:price, :status, :intensity, :review, :location, :date)
  end
end
