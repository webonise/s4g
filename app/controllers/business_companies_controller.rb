class BusinessCompaniesController < ApplicationController

  before_filter :authenticate_person! , :only => [:show_post]

  def show_post
    @business_company = BusinessCompany.find(params[:id])
    @posts = @business_company.posts.order("created_at DESC").paginate(:page =>1)
    @post = @business_company.posts.new
  end

end
