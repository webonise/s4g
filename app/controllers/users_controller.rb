class UsersController < ApplicationController

  def display_cause
    @user = User.find(params[:id])
    logger.info "##################################{@user.inspect}"
    @causes = Cause.all
  end

  def save_causes
       @user=User.find(params[:id])
         @user_causes=@user.user_causes
  end




end
