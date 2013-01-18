class ApplicationController < ActionController::Base
  before_filter :check_url

  protect_from_forgery
  #def after_sign_in_path_for(resource)
  #current_user_path
  # redirect_to display_dash_board_user_user_path
  #end

  private

  # Overwriting the sign_out redirect path method
  #def after_sign_out_path_for(resource_or_scope)
  # root_path
  #end

  def check_url
    #logger.info "########################   inside before filter ###############"
    if(request.url == "http://admin_s4g.weboapps.com/")
      redirect_to home_admins_path
    end
  end

end
