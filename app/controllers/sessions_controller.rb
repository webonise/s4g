class SessionsController < Devise::SessionsController

  def create
    #logger.info "======================#{params.inspect}"
    #binding.remote_pry

   # @user = Person.find_by_email(params[:person][:email])
    #if @user.nil?
     # redirect_to new_person_session_path
    #end
     #@user.valid_password?(params[:user][:password])
    ############logger.info(@user.inspect)
    #logger.info "################################################{@user.inspect}"
    #if sign_in(@user)
     # logger.info "################################################{@user.inspect}"
      redirect_to hello_path
    #end
  end
  end

