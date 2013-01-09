class BusinessCompany < ActiveRecord::Base
  belongs_to :business_user
  belongs_to :cause
  has_many :posts

  has_and_belongs_to_many :users
  #has_one :cause

  #has_many :business_has_users
  attr_accessible :address, :business_name, :contact, :description, :business_user_id
 # has_many :posts, :dependent => destroy
end
