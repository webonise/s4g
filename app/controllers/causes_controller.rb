class CausesController < ApplicationController

  def display_cause_business_sign_up
    @cause = Cause.find(params[:id])
    respond_to do |format|
      format.html
    end
  end


end