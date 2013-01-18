class UserMailer < ActionMailer::Base
   default from: "pansingh@weboniselab.com"
  #default from: "piu555ukirde@gmail.com"



  def registration_confirmation(user)
    @user = user

    mail(:to => user.email, :subject => "Welcome Sharing for good Site" )
  end
  def business_update(business_user)
    @business_user = business_user

    mail(:to => business_user.email, :subject => "Welcome Sharing for good Site" )
  end
end
