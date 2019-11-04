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
end
