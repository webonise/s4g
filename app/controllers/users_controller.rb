class UsersController < ApplicationController

<<<<<<< HEAD
  def index
    @users = User.all
=======

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
>>>>>>> 8fc4c5dfe0549312c9870438de7245e56c96da61
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    logger.info("#################{@user.inspect}")
  end

  def create
    @user = User.new(params[:user])
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
<<<<<<< HEAD
end
=======

end
>>>>>>> 8fc4c5dfe0549312c9870438de7245e56c96da61
