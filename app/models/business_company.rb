class BusinessCompany < ActiveRecord::Base
  mount_uploader :logo, LogoUploader
  has_many :users  ,:through =>   :business_has_users
  belongs_to :business_user
  has_many :business_has_users
  has_many :posts
  belongs_to :cause
  attr_accessible :address, :business_name, :contact, :description, :business_user_id , :cause_id, :logo
 # has_many :posts, :dependent => destroy

end
