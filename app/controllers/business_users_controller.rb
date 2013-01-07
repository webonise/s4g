class BusinessUsersController < ApplicationController
  def index
    @business_users = BusinessUser.all
  end

  def show
    @business_user = BusinessUser.find(params[:id])
  end

  def new
    @business_user = BusinessUser.new
    logger.info("#################{@business_user.inspect}")
  end

  def create
    @business_user = User.new(params[:business_user])
    if @business_user.save
      sign_in @business_user
      flash[:success] = "Welcome!"
      redirect_to @business_user
    else
      render 'new'
    end
  end
end