class BusinessUsersController < ApplicationController

  def get_cause_to_business
    @causes = Cause.all
    #logger.info("#################{@causes.inspect}")
  end

  def save_business_cause


  end
end
