class BusinessUsersController < ApplicationController

  def get_cause_to_business
    @causes = Cause.all
    @business_user = BusinessUser.find(params[:id])
    #logger.info("#################{@causes.inspect}")
  end

  def save_business_cause
    if params[:cause].nil?
      flash[:error] = "Please make a selection"
      redirect_to get_cause_to_business_business_user_path
    else
      @business_cause = BusinessCompany.find(params[:id])
      @business_cause.cause_id = params[:cause]

      if @business_cause.save!
        flash[:success] = "cause added"
        #TODO: redirecting to Business User Dashboard
      end
    end
    #logger.info "#################{@business_cause.inspect}"
  end


end


#if params[:answer].nil?
# flash[:error] = "Please make a selection"
#redirect_to selections_path
#end
