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
        @user_has_cause.cause_id = i.to_i
        c_id = @user_has_cause.cause_id
        if @user_has_cause.save
          flash[:success] = "cause submitted!"
          #redirect_to
        end
      end
    end
  end

  def display_businesses_of_causes
    @user = User.find(params[:id])

    @causes=@user.causes
    logger.info("################################{@causes.inspect}")
    @causes.each do |cause|
      @cause=@causes.find(cause.id) rescue nil
      logger.info("################################{@cause.inspect}")
      @businesses = @cause.business_companies rescue nil
      logger.info("################################{@businesses.inspect}")
    end

  end

  def save_business
    @user = User.find(params[:id])

    params[:business_select].each do |i|
      @business_has_user=BusinessHasUser.new
      @business_has_user.user_id=@user.id
      @business_has_user.business_company_id= i.to_i

      if @business_has_user.save
        flash[:success] = "Businesses submitted!"
        #redirect_to
      end
    end
  end
  def new
    @user = User.new

  end

  def show
    @user = User.find(params[:id])

  end

  def create
    @user = User.new(params[:user])
    # Handle a successful save.
    @user.person_role ="user"

    if @user.save
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
