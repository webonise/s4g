class PeopleController < ApplicationController
  def check_user
       @person = Person.find(params[:email])


       user = Person.find_by_email(params[:session][:email])
       if person && person.authenticate(params[:session][:password])
         sign_in user
         redirect_back_or user
       else
         flash.now[:error] = 'Invalid email/password combination'
         render 'new'
       end
  end

  end
end
