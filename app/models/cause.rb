class Cause < ActiveRecord::Base
  has_many :business_companies
  mount_uploader :logo, LogoUploader
  #has_many :users

  has_and_belongs_to_many :users
  attr_accessible :address, :cause_name, :description, :url

end
