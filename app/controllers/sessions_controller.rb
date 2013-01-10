class SessionsController < Devise::SessionsController

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user.nil?
      render '/people/sign_in'
    end
     @user.valid_password?(params[:user][:password])
    ############logger.info(@user.inspect)
    logger.info "################################################{@user.inspect}"
    if sign_in(@user)
      logger.info "################################################{@user.inspect}"
      redirect_to hello_path
    end
  end
  end

