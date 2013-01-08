class PostsController < ApplicationController
  #before_filter :signed_in_user, only: [:create, :destroy]
  #before_filter :correct_user,   only: :destroy
  def create
    @post = current_user.posts.build(params[:post])
      if @post.save
        flash[:success] = "Post created!"
        #TODO: redirecting to business user dashboard redirect_to root_url
      end
  end

  def destroy
    @post.destroy
    #TODO: redirecting redirect_to root_url
  end
end
