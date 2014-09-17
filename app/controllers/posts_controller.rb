class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy, :edit, :update]
  def index
    @posts = Post.all
  end

  def show

  end

  def new
    if session[:user_id]
      @post = Post.new
    else
      redirect_to posts_path, notice: "You must be signed in to create a Post!"
    end
  end

  def edit

  end

  def create
    post = current_user.posts.build(post_params)
    if post.save
      redirect_to posts_path, notice: "your post has been successfully created!"
    else
      render "new"
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path, notice: "post successfully updated"
    else
      render "edit"
    end
  end
  def destroy
    @post.destroy
    redirect_to root_url, notice: "Post successfully destroyed"
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :price)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end