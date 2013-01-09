class PostsController < ApplicationController
  #before_filter :signed_in_user, only: [:create, :destroy]
  #before_filter :correct_user,   only: :destroy
  #BusinessUser.current_user = @current_user

  def create
    #@post = Post.build(params[:post])
    #@post = current_user.posts.build(params[:post])

      @post = Post.new(params[:post])
      @post.business_company_id = 1
      logger.info("###############################{@post.inspect}")
      if @post.save!
        flash[:success] = "Post created!"
        redirect_to show_post_business_user_path(@post.business_company_id)
        #TODO: redirecting to business user dashboard redirect_to root_url
      else
        flash[:error] = "Post failed!"
        #TODO: redirecting to business user dashboard redirect_to root_url
      end
  end

  def destroy
    @post.destroy
    #TODO: redirecting redirect_to root_url
  end
end
