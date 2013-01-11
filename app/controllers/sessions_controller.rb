class SessionsController < Devise::SessionsController

  def create
    resource = warden.authenticate!(:scope => resource_name)
    sign_in(resource_name, resource)
    redirect_to display_dash_board_user_user_path(resource)
    #end
  end
end

