class BusinessUser < Person
  belongs_to :person
  has_one :business_company, :dependent => :destroy
  has_one :cause
  attr_accessible :first_name, :last_name, :role, :designation
  accepts_nested_attributes_for :business_company, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
