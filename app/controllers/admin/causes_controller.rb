class Admin::CausesController < ApplicationController
  # before_filter :authenticate_person! , :only => [:create, :edit, :update, :destroy]

  def new
    @cause = Cause.new
    @admin = current_person.id
  end

  def create
    @cause = Cause.new(params[:cause])
    if @cause.save
      flash[:success] = " cause Created successfully!"
      redirect_to show_admin_dashboard_admins_path
    else
      render '/new'
    end
  end

  def edit
    @admin = current_person.id
    @cause = Cause.find(params[:id])
  end

  def update
    @cause = Cause.find(params[:id])
    if @cause.update_attributes(params[:cause])
      flash[:success]= "Cause Updated Successfully"
     redirect_to   show_admin_dashboard_admins_path
    else
      render '/edit'
    end
  end

  def show
    @cause = Cause.find(params[:id])
  end
  def destroy
    @cause = Cause.find(params[:id])
    if @cause.business_companies.any? and UserHasCause.find_by_cause_id(@cause.id)
      flash[:error] = "You can't delete a cause"
      redirect_to  show_admin_dashboard_admins_path
    else
      @cause.destroy
      redirect_to show_admin_dashboard__admins_path
    end
  end
end
