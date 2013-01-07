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

  def edit
    @cause=Cause.find(params[:id])
  end

  def update
    @cause=Cause.find(params[:id])

    if @cause.update_attributes(params[:cause])
      flash[:success]="Cause Updated Successfully"
      redirct_to @cause
    else
      render 'edit'

    end
  end
end
