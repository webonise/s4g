class UsersController < ApplicationController
  before_filter :authenticate_person! , :only => [:display_cause, :display_businesses_of_causes, :display_dash_board_user]

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
          flash[:success] = "Causes Submitted!"

        end
      end
      redirect_to  display_businesses_of_causes_user_path(@user)
    else
      flash[:error] = "Please select atleast one Clause"
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
      redirect_to  display_dash_board_user_user_path(@user)
    else
      flash[:error] = "Please select atleast one Business"
      redirect_to display_businesses_of_causes_user_path(@user)
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
    @user.role = "user"
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      sign_in(@user)
      flash[:success] = "Welcome!"
      redirect_to share_on_Facebook_user_path(@user)
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

  def display_dash_board_user
    @user = User.find(params[:id])
    @user_causes = UserHasCause.find_all_by_user_id(@user.id)

    @user_causes.each do |user_cause|
      @business_company = BusinessCompany.find_all_by_cause_id(user_cause.cause_id)

      @business_company.each do |business_company|
        @posts = business_company.posts.order("created_at DESC").paginate(:page =>1)
      end
    end
    #logger.info("#########################{@posts.inspect}")
    #@posts = @business_company.posts.order("created_at DESC").paginate(:page =>1)
  end

def share_on_Facebook
  client = FacebookOAuth::Client.new(:application_id => '327682274009525',
                                     :application_secret => 'dde14950ca90f9cea5d248075dcd3ac5',
                                     :callback => 'http://www.s4g.com')



  url=client.authorize_url

  redirect_to(url)
  logger.info("##################{params[:code]}")
  #access_token = client.authorize(:code => params[:code])
  #
  ##logger.info("##################{url.inspect}")
  #
  #client = FacebookOAuth::Client.new(:application_id => '327682274009525',
  #                                   :application_secret => 'dde14950ca90f9cea5d248075dcd3ac5',
  #                                   :token => access_token)
  #
  #client.authorize_url(:scope => 'publish_stream')
  #
  #client.me.feed(:create, :message => 'Testing Facebook app second time8.54pm...')
  #
  #redirect_to display_cause_user_path(@user)
end
end
