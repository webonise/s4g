class Admin::CausesController < ApplicationController
 # before_filter :authenticate_person! , :only => [:create, :edit, :update, :destroy]

  def new

    @cause=Cause.new
    @admin=Person.find(current_person.id)
    logger.info("#####################{@admin.inspect}")
  end

  def create
     logger.info("#####################admin cause create")
    @cause = Cause.new(params[:cause])

    if @cause.save
      flash[:success] = " cause Created successfully!"
      #redirect_to 'new'
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
      redirect_to @cause
    else
      render 'edit'
    end
  end

  def show
    @cause=Cause.find(params[:id])
  end
end
