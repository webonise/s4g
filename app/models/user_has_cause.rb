class UserHasCause < ActiveRecord::Base
  belongs_to :user
  belongs_to :cause
  attr_accessible :cause_id, :user_id
end
