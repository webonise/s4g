class SessionsController < Devise::SessionsController

  def create

    resource = warden.authenticate!(:scope => resource_name)
    sign_in(resource_name, resource)

    if current_person.admin?

      redirect_to show_admin_dashboard_admins_path

    else

      if current_person.role.include?("business_user")
        @business_company = BusinessCompany.find_by_business_user_id(resource.id)
        redirect_to show_post_business_company_path(@business_company)
      else
        @user = User.find(resource.id)
        redirect_to  display_dash_board_user_user_path(@user)
      end

    end

  end
end

