class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    user = User1.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url, alert: "user logged in :D"
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_url, alert: "user logged out :D"
  end
end