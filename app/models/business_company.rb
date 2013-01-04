class BusinessCompany < ActiveRecord::Base
  belongs_to :business_user
  belongs_to :cause
  has_many :posts
  #has_one :causes
  #has_many :business_has_users
  attr_accessible :address, :business_name, :contact, :description
end
