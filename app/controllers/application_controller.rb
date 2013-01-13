class ApplicationController < ActionController::Base
  protect_from_forgery
  #def after_sign_in_path_for(resource)
  #current_user_path
  # redirect_to display_dash_board_user_user_path
  #end

  #private

  # Overwriting the sign_out redirect path method
  #def after_sign_out_path_for(resource_or_scope)
  # root_path
  #end
end
