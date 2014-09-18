class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :posts]
  def index
    @categories = Category.all
  end

  def show
    @posts = @category.posts
  end

  def new
    if session[:user_id]
      @category = Category.new
    else
      redirect_to categories_path, alert: "You must be logged in to create a category"
    end
  end

  def posts
    @posts = @category.posts
    render "show"
  end
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: "Category Successfully created!"
    else
      render "new"
    end
  end
  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end

