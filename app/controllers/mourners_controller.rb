class MournersController < ApplicationController
  before_action :authenticate_mourner!
  skip_before_action :authenticate_mourner!, only: [:index, :show]

  def index
  end

  def show
  end

  def edit
  end

  def update
  end
end
