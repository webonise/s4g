class PostsController < ApplicationController

  def new

  end

  def create
    @post = current_business_user.microposts.build(params[:post])
    if @post.save
      flash[:success] = "post created!"
      redirect_to root_url
end
