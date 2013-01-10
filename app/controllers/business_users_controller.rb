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
    # Handle a successful save.
    if @business_user.save
      sign_in @business_user
      flash[:success] = "Welcome!"
      redirect_to @business_user
    else
      render 'new'
    end
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
      @business_company = BusinessCompany.find_by_business_user_id(params[:id])
      @business_company.cause_id = params[:cause]

      if @business_company.save!
        flash[:success] = "cause added"
        redirect_to show_post_business_user_path(params[:id])
        #TODO: redirecting to Business User Dashboard
      end
    end
    #logger.info "#################{@business_cause.inspect}"
  end

  def show_post
    @business_user = BusinessUser.find(params[:id])
    @business_company = @business_user.business_company
    @post = @business_company.posts.new
    @posts = @business_company.posts.order("created_at desc").paginate(page: params[:page])
  end

  def get_business_details
    #@business_user = BusinessUser.find(params[:id])
    #@business_company = BusinessCompany.new
    #@business_company = @business_user.BusinessCompany
    #
    #if @business_company.save!
    #  flash[:success] = "company added"
    #  #Todo: Take the B_User_Id for business company & save it
    #  #Todo: redirecting to Business User select only one cause
    #end
  end

end