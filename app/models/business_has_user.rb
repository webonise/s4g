class BusinessHasUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :business_company
  attr_accessible :business_company_id, :user_id
end
