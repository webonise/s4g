class User < ActiveRecord::Base
  belongs_to :person
  #has_many :business_companies, :through => :business_has_users
  has_and_belongs_to_many :business_companies
  #has_many :causes, :through => :user_has_causes
  has_and_belongs_to_many :causes
  has_one :impression
  has_many :user_has_causes, dependent:  :destroy
  has_many :business_has_users, dependent:  :destroy

  accepts_nested_attributes_for :person
  attr_accessible :first_name, :last_name, :person_attributes
end
