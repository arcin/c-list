class UsersController < ApplicationController
  before_action :set_user, only: [:posts]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: "Signed Up!"
    else
      render "new"
    end
  end

  def index
  end

  def posts
    @posts = @user.posts
  end
  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
