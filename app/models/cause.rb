class Cause < ActiveRecord::Base
  mount_uploader :logo, LogoUploader

  has_many :business_companies
  has_many :business_has_users
  has_many :users , :through =>  :user_has_causes

  attr_accessible :address, :cause_name, :description, :url, :logo

  def get_businesses
    puts "###$$$$$#{self.business_companies}"
    self.business_companies
  end
end
