class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: "Successfully logged in!"
    else
      flash.now.alert = "Username or Password is invalid!"
      render "new"
    end
  end
end