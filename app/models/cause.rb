class Cause < ActiveRecord::Base
  has_many :business_companies
  #has_many :users
  attr_accessible :address, :cause_name, :description, :url
end
