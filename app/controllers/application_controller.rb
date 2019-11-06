class ApplicationController < ActionController::Base
  helper_method :user_signed_in?
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action"
  #   redirect_to(root_path)
  # end

  def after_sign_in_path_for(user)
    if current_mourner
      edit_mourner_path(user)
    elsif current_client
      edit_client_path(user)
    end # your path
  end

  def user_signed_in?
    mourner_signed_in? || client_signed_in?
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
