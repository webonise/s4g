class User < Person
  belongs_to :person
  has_many :business_companies, :through => :business_has_users
  has_many :causes, :through => :user_has_causes
  has_one :impression
  attr_accessible :first_name, :last_name


end
