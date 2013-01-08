class UsersController < ApplicationController


  #before_filter :authenticate_user!

  def new
    @user = User.new
    logger.info("#################{@user.inspect}")
  end

  def create
    @user = User.new(params[:user])
    # Handle a successful save.
    if @user.save
      sign_in @user
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
  	@users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def show
  	@user = User.find(params[:id])
  end

  def destroy
  	User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

end
