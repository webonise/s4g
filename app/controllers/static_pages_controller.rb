class StaticPagesController < ApplicationController
  def hello

  end

  def home
    #if person_signed_in?
      #if current_person.admin?

       # redirect_to admin_dashboard_path(resource)

      #else if current_person.role.include?("business_user")
       #   @business_company = BusinessCompany.find_by_business_user_id(resource.id)
       #   redirect_to show_post_business_company_path(@business_company)
      #else
       #   @user = User.find(resource.id)
        #  redirect_to  display_dash_board_user_user_path(@user)
      #end

      #end
    #else
     # redirect_to root_path
    #end


  end

end
