class ApplicationController < ActionController::Base
  def after_sign_in_path_for(user)
    if current_mourner
      edit_mourner_path(user)
    elsif current_client
      edit_mourner_path(user)
    end # your path
  end
end
