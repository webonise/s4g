class Post < ActiveRecord::Base
  belongs_to :business_company
  has_one :impression
  attr_accessible :content, business_company_id
  validates :business_company_id, :presence => true
end
