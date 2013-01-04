class Post < ActiveRecord::Base
  belongs_to :business_company
  has_one :impression
  attr_accessible :content
end
