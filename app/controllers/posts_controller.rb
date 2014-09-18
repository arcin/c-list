class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy, :edit, :update]
  before_action :set_category, only: [:index, :new, :create]
  def index
    @posts = @category.posts
  end

  def show
  end

  def new
    if session[:user_id]
      @post = Post.new
    else
      redirect_to category_posts_path(@category), alert: "You must be signed in to create a Post!"
    end
  end

  def edit
  end

  def create
    post = current_user.posts.build(post_params)
    if post.save
      redirect_to category_posts_path(@category), notice: "Your post has been successfully created!"
    else
      render "new"
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path, notice: "Post successfully updated"
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
    params.require(:post).permit(:title, :description, :price, :category_id)
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end