class UsersController < ApplicationController
  before_filter :authenticate_person! , :only => [:edit,:display_cause, :display_businesses_of_causes, :display_dash_board_user,:sign_up_facebook, :share_on_facebook, :edit_user_causes, :edit_businesses_of_user,:edit,:update]

  def index
    @users = User.all
  end

  def display_cause
    @user = User.find(params[:id])
    @causes = Cause.all.paginate(:page => params[:page], :per_page => 4)
  end

  def save_causes
    @user = User.find(params[:id])

    if params[:cause_select].present?
      # @user_has_causes=@user.user_has_causes.build(params[:cause_select])
      @user_causes = @user.user_has_causes  rescue nil
      @user_causes.each do |user_cause|
        user_cause.delete
      end

      params[:cause_select].each do |i|
        @user_has_cause = UserHasCause.new
        @user_has_cause.user_id = @user.id
        @user_has_cause.cause_id = i.to_i
        if @user_has_cause.save
          flash[:success] = "Causes Submitted!"
        end
      end

      redirect_to  display_businesses_of_causes_user_path(@user)
    else
      flash[:error] = "Please select atleast one Cause"
      redirect_to display_cause_user_path(@user)
    end
  end

  def display_businesses_of_causes
    @user = User.find(params[:id])
    @user_causes = @user.causes
  end

  def save_business
    @user = User.find(params[:id])
    @user_causes=@user.causes
    if params[:business_select].present?
      @businesses_users=@user.business_has_users rescue nil
      @businesses_users.each do |business_has_user|
        business_has_user.delete
      end
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
      @business = @businesses.find(business.id) rescue nil
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
      redirect_to sign_up_user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end


  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  def display_dash_board_user
    company_post = Hash.new
    @company_post_list = Array.new
    @user = User.find(params[:id])
    business_company = @user.business_companies
    posts = Post.order("created_at DESC").find_all_by_business_company_id(business_company.collect{|i| i.id})

    posts.each do |p|
      bc = BusinessCompany.find(p.business_company_id)
      company_post = {"company" => bc, "post" => p}
      @company_post_list.push(company_post)
    end
    #@posts = @posts.paginate(:page => 5, :per_page => 7)
    #@company_post_list = @company_post_list.paginate(:page => 5, :per_page => 7)
  end

  def sign_up_facebook
    @user = User.find(params[:id])
    if params[:old_user].present?
      @@old_user = params[:old_user]
      @@post = params[:post]
    else
      @@old_user = false
    end

    @@client = FacebookOAuth::Client.new(:application_id => APP_ID,
                                         :application_secret => APP_SECRET_KEY,
                                         :callback => 'http://local.s4g.com/users/'+@user.id.to_s+'/callback')
    url = @@client.authorize_url
    redirect_to url
  end


  def get_businesses
    cause = Cause.find(params[:cause])
    @businesses = cause.business_companies
    @businesses = cause.business_companies
    respond_to do |format|
      format.js
    end
  end

  def show_business
    @business_company = BusinessCompany.find(params[:business_company])
    respond_to do |format|
      format.js
    end
  end

  def sign_up
    @user = User.find(params[:id])
  end

  def callback
    @user = User.find(params[:id])
    access_token = @@client.authorize(:code => params[:code])
    token = access_token.token
    @user.fb_token = token
    if @user.save
      flash[:success] = "Facebook Authenticated Successfully"
    else
      flash[:error] = "Facebook Authentication Failed"
    end
    if @@old_user
      redirect_to share_on_facebook_user_path(@user, :post => @@post)
    else
      redirect_to display_cause_user_path(@user)
    end
  end


  def share_on_facebook
    @user = User.find(params[:id])
    token = @user.fb_token
    post = Post.find(params[:post])
    if token.nil?
      flash[:notice] = "You must be registered with Facebook to do that."
      redirect_to sign_up_facebook_user_path(@user, :old_user => true, :post => post)
    else
      @@client = FacebookOAuth::Client.new(:application_id => APP_ID,
                                           :application_secret => APP_SECRET_KEY,
                                           :token => token)

      @@client.authorize_url(:scope => 'publish_stream')
      @@client.me.feed(:create, :message => post.content)

      impression = Impression.new()
      impression.post_id = post.id
      impression.user_id = @user.id
      impression.fund_raise = FUND_SEND
      impression.save
      flash[:success] = "Shared on facebook successfully"
      redirect_to display_dash_board_user_user_path(@user)
    end
  end

  #flash[:notice] = "You must be registered with Twitter to do that."
  #respond_to do |format|
  #  format.js { render(:update) { |page| page.redirect_to authentications_url } }
  #
  #end
  #
  #format.js { render :js => "window.location.href = '#{some_path}'" }

  def edit_user_causes
    @user = User.find(params[:id])
    @user_causes = @user.causes
    @all_causes = Cause.all
    @causes = @all_causes - @user_causes

  end

  def edit_businesses_of_user

    cause_businesses = Array.new
    @user = User.find(params[:id])
    @user_businesses = @user.business_companies
    @causes = @user.causes

    @causes.each do |cause|
      cause_businesses.push(cause.business_companies)
    end

    @all_businesses = cause_businesses.flatten - @user_businesses

  end

end
