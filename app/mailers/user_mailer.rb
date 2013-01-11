class UserMailer < ActionMailer::Base
  default from: "pansingh@weboniselab.com"
  def welcome_email(user)
    @user = user
    #@url  = "54.235.221.105"
    @url ="http://www.s4g.com/"
    mail(:to => user.email, :subject => "Welcome Sharing for good Site")
  end
end
