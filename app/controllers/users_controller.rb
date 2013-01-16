class UsersController < ApplicationController
  before_filter :authenticate_person! , :only => [:display_cause, :display_businesses_of_causes, :display_dash_board_user]

  def index
    @users = User.all
  end

  def display_cause
    @user = User.find(params[:id])
    @causes = Cause.includes(:business_companies).all
    logger.info("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#{@causes.inspect}")
  end

  def save_causes
    @user = User.find(params[:id])

    if params[:cause_select].present?
      # @user_has_causes=@user.user_has_causes.build(params[:cause_select])
      if @user.user_has_causes.present?
        flash[:error] = "Causes already submitted"
      else
        params[:cause_select].each do |i|
          @user_has_cause = UserHasCause.new
          @user_has_cause.user_id = @user.id
          @user_has_cause.cause_id = i.to_i
          if @user_has_cause.save
            flash[:success] = "Causes Submitted!"
          end
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
      if @user.business_has_users.present?
        flash[:error] = "Businesses already submitted"
      else
        params[:business_select].each do |i|
          @business_has_user = BusinessHasUser.new
          @business_has_user.user_id = @user.id
          @business_has_user.business_company_id = i.to_i
          if @business_has_user.save!
            flash[:success] = "Businesses submitted!"
          end
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
      redirect_to sign_up_user_path(@user)
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
        @posts = business_company.posts.order("created_at DESC")
      end
    end
    #logger.info("#########################{@posts.inspect}")
    #@posts = @business_company.posts.order("created_at DESC").paginate(:page =>1)
  end

  def sign_up_facebook
    @user = User.find(params[:id])
    @@old_user = params[:old_user]

    @@client = FacebookOAuth::Client.new(:application_id => '327682274009525',
                                         :application_secret => 'dde14950ca90f9cea5d248075dcd3ac5',
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
    logger.info("##################################{@@old_user.inspect}")
    if @@old_user == 1
      redirect_to share_on_facebook_user_path(@user)
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
      #respond_to do |format|
        #format.html
        redirect_to sign_up_facebook_user_path(@user, :old_user => 1)
      #end
    else
      @@client = FacebookOAuth::Client.new(:application_id => '327682274009525',
                                           :application_secret => 'dde14950ca90f9cea5d248075dcd3ac5',
                                           :token => token)

      @@client.authorize_url(:scope => 'publish_stream')
      @@client.me.feed(:create, :message => post.content)
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

end
