class ApplicationController < ActionController::Base
  helper_method :user_signed_in?

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
end
