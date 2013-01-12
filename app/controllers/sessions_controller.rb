class SessionsController < Devise::SessionsController

  def create
    resource = warden.authenticate!(:scope => resource_name)
    #@person = Person.find_by_email(params[:email])
    sign_in(resource_name, resource)
    #@person = Person.find_by_email(params[:email])
    #logger.info("#################################{@person.inspect}")
    #@role = @person.role
    #if @role.include?("business_user")
      #@business_company=BusinessCompany.find_by_business_user_id(@person.id)
     # logger.info("#################################{@person.inspect}")
      #logger.info("#################################{@business_company.inspect}")
      #redirect_to show_post_business_company_path(@person.id)
    #else
      redirect_to display_dash_board_user_user_path(resource)
    #end
  end
end

