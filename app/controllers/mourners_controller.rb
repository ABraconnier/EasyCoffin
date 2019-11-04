class MournersController < ApplicationController
  before_action :authenticate_mourner!
  skip_before_action :authenticate_mourner!, only: [:index, :show]

  def index
    @mourners = Mourner.all
  end

  def show
    @mourner.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def mourners_params
    params.require(:mourner).permit(:first_name, :last_name, :account_number, :age, :years_of_expertise, :mourning_intensity, :price_range)
  end
end
