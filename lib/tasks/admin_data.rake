namespace :db do
  desc "Fill database with admin details"
  task populate: :environment do
    admin = Person.create!(email: "admin@S4G.com",
                         password: "Share4g",
                         password_confirmation: "Share4g",admin: true)
    admin1 =  Person.create!(email: "admin1@S4G.com",
                             password: "Share4g",
                             password_confirmation: "Share4g",admin: true)

  end
end
