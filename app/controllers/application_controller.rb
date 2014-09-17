class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :post_owner?

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def post_owner?(post)
    current_user == post.user
  end
end
