class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    if session[:user_id]
      @user = User.new
    else
      redirect_to posts_path, notice: "You must be signed in to create a Post!"
    end
  end
end