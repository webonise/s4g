class StaticPagesController < ApplicationController
  def hello

  end

  def home
    #if person_signed_in?
   # if current_person.admin?

     #redirect_to show_admin_dashboard_admins_path

    #else if current_person.role.include?("business_user")
       #@business_company = BusinessCompany.find_by_business_user_id(resource.id)
      # redirect_to show_post_business_company_path(@business_company)
    #else
    #   @user = User.find(current_person.id)
     # redirect_to  display_dash_board_user_user_path(@user)
    #end

   # end
    #else
    # redirect_to root_path
    #end

   #@user = Person.new
  end

end
