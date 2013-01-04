class Person < ActiveRecord::Base

  attr_accessible :email, :password, :person_role
  has_one :user
  has_one :business_user
end
