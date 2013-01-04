class BusinessUser < ActiveRecord::Base
  belongs_to :person
  has_one :business_company
  attr_accessible :first_name, :last_name
end
