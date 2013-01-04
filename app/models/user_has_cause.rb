class UserHasCause < ActiveRecord::Base
  belongs_to :user
  belongs_to :cause
  # attr_accessible :title, :body
end
