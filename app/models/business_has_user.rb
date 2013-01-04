class BusinessHasUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :business_company
  # attr_accessible :title, :body
end
