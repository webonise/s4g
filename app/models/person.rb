class Person < ActiveRecord::Base

  attr_accessible :email, :password, :person_role, :type, :password_confirmation
  #has_one :user
  has_secure_password
  has_one :business_user

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  class << self
    def new_with_cast(*a,&b)
      if (h = a.first).is_a? Hash and (type = h[:type] || h['type']) and (klass = type.constantize) != self
        raise "Error!!" unless klass < self  # klass should be a descendant of User
        return klass.new(h, &b)
      end
      new_without_cast(*a, &b)
    end
    alias_method_chain :new, :cast
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end