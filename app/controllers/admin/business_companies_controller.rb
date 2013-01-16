class Admin::BusinessCompaniesController < ApplicationController
  def show
    @business=BusinessCompany.find(params[:id])
  end

  def destroy
   @business= BusinessCompany.find(params[:id])
    @business.destroy
    redirect_to show_admin_dashboard_business_admins_path
  end
end
