class User < Person
  # attr_accessible :title, :body
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  #belongs_to :person
  has_many :business_companies, :through => :business_has_users
  has_many :causes, :through => :user_has_causes
  has_one :impression

  attr_accessible :first_name, :last_name

end
