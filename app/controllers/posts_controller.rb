class PostsController < ApplicationController

  before_filter :authenticate_person! , :only => [:create, :destroy]
  #before_filter :correct_user,   only: :destroy
  #BusinessUser.current_user = @current_user

  def create
    @post = Post.create(:content => params[:post][:content], :business_company_id => params[:business_company_id])

    if @post.content==""

      flash[:error] = "Content can't be blank!"
      redirect_to show_post_business_company_path(@post.business_company_id)

    else

      if @post.save!

        flash[:success] = "Post created!"
        redirect_to show_post_business_company_path(@post.business_company_id)
        #TODO: redirecting to business user dashboard redirect_to root_url

      else

        flash[:error] = "Post failed!"
        #TODO: redirecting to business user dashboard redirect_to root_url
        redirect_to show_post_business_company_path(@post.business_company_id)

      end

    end

  end

  def destroy
    @post.destroy
    #TODO: redirecting redirect_to root_url
  end
end