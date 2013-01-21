class BusinessUser < Person
  belongs_to :person
  has_one :business_company , :dependent => :destroy
  has_one :cause

  accepts_nested_attributes_for :business_company  #_attributes# , :reject_if => lambda { |a| a[:business_user_id].nil? }, :allow_destroy => true
  attr_accessible :first_name, :last_name, :role, :designation
end
