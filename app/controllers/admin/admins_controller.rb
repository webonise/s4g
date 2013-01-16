class Admin::AdminsController < ApplicationController

  def show_admin_dashboard
    if current_person.admin?
      @admin=Person.find(current_person.id)
      logger.info("###############################{@admin.id}")
      @causes=Cause.all
    end

  end
end
