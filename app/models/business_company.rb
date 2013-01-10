class BusinessCompany < ActiveRecord::Base
  has_many :users  ,:through =>   :business_has_users
  belongs_to :business_user
  has_many :business_has_users
  has_many :posts

  attr_accessible :address, :city, :country, :business_name, :logo, :contact, :description, :business_user_id, :causes_id
 # has_many :posts, :dependent => destroy
  def find_businesses_of_cause(c_id)
    business_ids=BusinessCompany.where('causes_id=?',c_id)
  end
end
