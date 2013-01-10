class User < Person

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :business_companies, :through => :business_has_users
  has_many :causes, :through => :user_has_causes
  has_one :impression
  has_many :user_has_causes
  has_many :business_has_users

  attr_accessible :first_name, :last_name

end

