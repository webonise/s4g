class BusinessUsersController < ApplicationController

  def index
    @business_users = BusinessUser.all
  end

  def show
    @business_user = BusinessUser.find(params[:id])
  end

  def new
    @business_user = BusinessUser.new
     #logger.info("#################{@business_user.inspect}")
  end

  def create
    @business_user = BusinessUser.new(params[:business_user])

     @business_user.save
      sign_in @business_user
      flash[:success] = "Welcome!"
      redirect_to get_business_details_business_user_path


  end

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

  def get_business_details
       @business_user = BusinessUser.find(params[:id])
       @business_company = @business_user.business_company

       #if @business_company.save!
       #  flash[:success] = "company added"
       #
       #end

  end

  def put_business_details

  end

end

#if params[:answer].nil?
# flash[:error] = "Please make a selection"
#redirect_to selections_path
#end

