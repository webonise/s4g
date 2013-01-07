class UsersController < ApplicationController
  def display_cause
    @causes = Cause.all
  end

end
