class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def display_cause
    @user = User.find(params[:id])
    @causes = Cause.all
  end

  def save_causes
    @user = User.find(params[:id])

      if params[:cause_select].present?
      params[:cause_select].each do |i|

        @user_has_cause = UserHasCause.new
        @user_has_cause.user_id = @user.id
        @user_has_cause.cause_id = i.to_i
        c_id = @user_has_cause.cause_id

        if @user_has_cause.save
          flash[:success] = "cause submitted!"

        end
      end
      redirect_to  display_businesses_of_causes_user_path(@user)
      else
        flash[:error] = "Please select atleast one clause"
        redirect_to display_cause_user_path(@user)
      end

    end



  def display_businesses_of_causes
    @user = User.find(params[:id])
    @user_causes = @user.causes
    #@business_user=@user.business_companies
  end

  def save_business
    @user = User.find(params[:id])
    @user_causes=@user.causes
    if params[:business_select].present?

      params[:business_select].each do |i|
        @business_has_user = BusinessHasUser.new
        @business_has_user.user_id = @user.id
        @business_has_user.business_company_id = i.to_i
        if @business_has_user.save!
          flash[:success] = "Businesses submitted!"
        end
      end
      redirect_to '/'
    else
      flash[:error] = "Please select busineses"
      render display_businesses_of_causes_user_path
    end
  end

  def display_post
    @user = User.find(params[:id])
    @businesses=@user.business_has_users

    @businesses.each do |business|
      @business=@businesses.find(business.id) rescue nil
      @posts = @business.posts  rescue nil
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
    #@user.person_role ="user"
     # logger.info "##################################{@user.inspect}"
    if @user.save
      sign_in(@user)
      flash[:success] = "Welcome!"
      redirect_to display_cause_user_path(@user)
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
  def display_dash_board

  end

end
