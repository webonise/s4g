class UserMailer < ActionMailer::Base
  # default from: "pansingh@weboniselab.com"
  default from: "piu555ukirde@gmail.com"

  #@url ="http://www.s4g.com/"

  def registration_confirmation(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome Sharing for good Site" )
  end
end
