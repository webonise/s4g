class UsersController < ApplicationController

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

end
