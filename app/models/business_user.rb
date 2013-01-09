class BusinessUser < Person
  belongs_to :person
  has_one :business_company
  has_one :cause
  attr_accessible :first_name, :last_name
end
