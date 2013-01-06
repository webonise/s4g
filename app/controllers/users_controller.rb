class UsersController < ApplicationController
	def new

  end

  def index
  	@users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  	@person = Person.find(params[:id])
  end

  def show
  	@user = User.find(params[:id])
  	@person = Person.find(params[:id])
  end

  def destroy
  	User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end
end
