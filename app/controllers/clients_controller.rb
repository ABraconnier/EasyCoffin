class ClientsController < ApplicationController
  before_action :authenticate_client!
  skip_before_action :authenticate_client!, only: [:edit, :update]
  def index
  end

  def show
  end

  def edit
  end

  def update
  end
end
