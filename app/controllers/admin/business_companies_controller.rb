class Admin::BusinessCompaniesController < ApplicationController
  def show
    @business=BusinessCompany.find(params[:id])
  end

  def destroy
    @business= BusinessCompany.find(params[:id])
    @business.destroy
    redirect_to show_admin_dashboard_business_admins_path
  end

  def edit
    @admin=current_person.id
    @business=BusinessCompany.find(params[:id])
  end

  def update
    @business=BusinessCompany.find(params[:id])
    @business_user=@business.business_user
    if @business.update_attributes(params[:business_company])
      UserMailer.business_update(@business_user).deliver
      flash[:success]="Business company Updated Successfully"
      redirect_to show_admin_dashboard_business_admins_path
    else
      render 'edit'
    end
  end
end