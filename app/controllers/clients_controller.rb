class ClientsController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_client!
  skip_before_action :authenticate_client!, only: [:edit, :update]

  def index
  end

  def show
  end

  def edit
    @client = Client.find(params[:id])
    if current_client == @client
      authorize @client
    end
  end

  def update
    @client = Client.find(params[:id])
    authorize @client
    @client.update(client_params)
    redirect_to edit_client_path(@client)
  end

  private

  def client_params
    params.require(:client).permit(:first_name, :last_name, :account_number, :location, :profile_picture)
  end

  def pundit_user
    current_client
  end
end
