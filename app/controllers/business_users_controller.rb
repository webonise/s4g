class BusinessUsersController < ApplicationController
  before_filter :authenticate_person! , :only => [:get_cause_to_business, :get_business_detail]

  def index
    @business_users = BusinessUser.all
  end

  def show
    @business_user = BusinessUser.find(params[:id])
  end

  def edit
    @business_user = BusinessUser.find(params[:id])
    @business_company = @business_user.business_company
  end

  def update
    @business_user = BusinessUser.find(params[:id])
    @business_company = @business_user.business_company

    if (@business_user.update_attributes(params[:business_user]) || @business_company.update_attributes(params[:business_company_attributes]))
      flash[:success] = "Your Profile is updated"
      redirect_to root_path
    else
      render 'edit'
    end
    #
    #if @business_user.save
    #  flash[:success] = "Your Profile is updated."
    #  redirect_to show_post_business_company_path(@business_company.id)
    #end
  end


  def new
    @business_user = BusinessUser.new
    @business_user.build_business_company
    @causes = Cause.all
  end


  def create
    @business_user = BusinessUser.new(params[:business_user])
    if params[:cause].present?
      @business_company = @business_user.business_company
      @business_company.cause_id = params[:cause]
      @business_company = params[:business_company_attributes]

      @business_user.role = "business_user"
      if @business_user.save
        UserMailer.registration_confirmation(@business_user).deliver
        sign_in @business_user
        flash[:success] = "Welcome!"
        @business_company = BusinessCompany.find_by_business_user_id(@business_user.id)
        redirect_to show_post_business_company_path(@business_company.id)
      else
        render 'new'
      end
    else
      flash[:error] = "Please select at least one cause"
      redirect_to new_business_user_path
    end

  end



  #def get_cause_to_business
  #  @causes = Cause.all
  #  @business_user = BusinessUser.find(params[:id])
  #end
  #
  #def save_business_cause
  #  if params[:cause].nil?
  #    flash[:error] = "Please make a selection"
  #    render get_cause_to_business_business_user_path
  #  else
  #    @business_company = BusinessCompany.find_by_business_user_id(params[:id])
  #    @business_company.cause_id = params[:cause]
  #
  #    if @business_company.save
  #      flash[:success] = "cause added"
  #      redirect_to show_post_business_company_path(@business_company.id)
  #    end
  #  end
  #end

  #def get_business_detail
  #  @business_user = BusinessUser.find(params[:id])
  #  @business_company = BusinessCompany.new
  #end

  #def save_business_detail
  #  @business_user = BusinessUser.find(params[:id])
  #  @business_company = BusinessCompany.new(:business_user_id => @business_user.id)
  #  @business_company.attributes = params[:business_company]
  #
  #  if @business_company.save
  #    flash[:success] = "company added"
  #    redirect_to get_cause_to_business_business_user_path(@business_user)
  #  end
  #end
end
