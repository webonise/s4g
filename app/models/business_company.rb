class BusinessCompany < ActiveRecord::Base
  belongs_to :business_user
  belongs_to :cause
  has_many :posts
  #has_one :cause
  #has_many :business_has_users
  attr_accessible :address, :business_name, :contact, :description
end
