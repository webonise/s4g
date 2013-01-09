class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def display_cause
    @user = User.find(params[:id])
    logger.info "##################################{@user.inspect}"
    @causes = Cause.all
    logger.info "##################################{@causes.inspect}"
  end

  def save_causes

    if params[:cause_select]
      @user = User.find(params[:id])
      params[:cause_select].each do |i|
        @user_has_cause=UserHasCause.new
        @user_has_cause.user_id = @user.id
        @user_has_cause.causes_id = i.to_i

        if @user_has_cause.save
          flash[:success] = "cause submitted!"
          #redirect_to
        end
      end
    end
  end

  def new
    @user = User.new
    #logger.info("#################{@user.inspect}")
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save!
      sign_in @user
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end
end
