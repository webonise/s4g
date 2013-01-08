class User < Person
  # attr_accessible :title, :body

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model

  has_many :business_companies, :through => :business_has_users
  has_many :causes, :through => :user_has_causes
  has_one :impression

<<<<<<< HEAD
  attr_accessible :first_name, :last_name
=======
  #attr_accessible :first_name, :last_name

>>>>>>> 8fc4c5dfe0549312c9870438de7245e56c96da61
end

