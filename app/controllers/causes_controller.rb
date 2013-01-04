class CausesController < ApplicationController
  def new
    @cause=Cause.new
  end
  def create
    @cause=Cause.new(params[:@cause])
    if @cause.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to '/create_cause'
else
      render 'new'
    end
  end
end
