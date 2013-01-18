ActionMailer::Base.smtp_settings = {
    :enable_starttls_auto => true,
    :address            => "smtp.gmail.com",
    :port               => "587",
    :domain             => "gmail.com",
    :authentication     => :plain,
    :user_name          => "pansingh@weboniselab.com", #should be you@domain.com
    :password           => "pansingh6186"
}

#----------------For localhost------------
#ActionMailer::Base.default_url_options[:host] = "localhost:3000"