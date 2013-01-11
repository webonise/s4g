class PeopleController < ApplicationController

  def check_user
    @person = Person.find(params[:email])

    user = Person.find_by_email(params[:session][:email])
    business_user = Person.find_by_email(params[:session][:email])
    if person && person.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end

    if person && person.authenticate(params[:session][:password])
      sign_in business_user
      redirect_back_or business_user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end
end
