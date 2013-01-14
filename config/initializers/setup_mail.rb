ActionMailer::Base.smtp_settings = {
    :enable_starttls_auto => true,
    :address            => "smtp.gmail.com",
    :port               => "587",
    :domain             => "gmail.com",
    :authentication     => :plain,
    :user_name          => "piu555ukirde@gmail.com", #should be you@domain.com
    :password           => "akshaypinu"
}

#----------------For localhost------------
#ActionMailer::Base.default_url_options[:host] = "localhost:3000"