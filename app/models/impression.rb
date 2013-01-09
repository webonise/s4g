class Impression < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  attr_accessible :fund_raise
end
