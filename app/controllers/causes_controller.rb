class CausesController < ApplicationController

  def index
    @causes=Cause.all
  end

  def new
    @cause=Cause.new
  end

  def create
    @cause = Cause.new(params[:cause])

    if @cause.save
      flash[:success] = " cause Created successfully!"
      redirect_to '/index'
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