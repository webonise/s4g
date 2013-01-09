class Post < ActiveRecord::Base
  belongs_to :business_company
  has_one :impression
  attr_accessible :content, :business_company_id
  #cattr_accessor :current_user
 validates :business_company_id, :presence => true
 validates :content, :presence => true, :length => { :maximum => 200 }
end
