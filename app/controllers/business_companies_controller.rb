class BusinessCompaniesController < ApplicationController

  def show_post
    @business_company = BusinessCompany.find(params[:id])
    #logger.info("###########################{@business_user.inspect}")
    #@business_company = @business_user.business_company
    #logger.info("###########################{@business_company.inspect}")
    @posts = @business_company.posts.paginate(:page =>1)
    logger.info("###########################{@posts.inspect}")
    @post = @business_company.posts.new
  end
end
