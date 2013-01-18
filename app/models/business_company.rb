class BusinessCompany < ActiveRecord::Base
  mount_uploader :business_logo, LogoUploader
  has_many :users  ,:through =>   :business_has_users
  belongs_to :business_user
  has_many :business_has_users
  #has_many :posts

  attr_accessible :address, :city, :country, :business_name, :business_logo, :business_website, :contact, :description, :business_user_id, :cause_id

  belongs_to :cause

   has_many :posts, :dependent => :destroy

end
