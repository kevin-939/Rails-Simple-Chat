class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:session][:username])
    if user
      log_in(user)
    else
      flash.notice = params[:session][:username]+" username has not been registered."
      re_try
    end
  end

  def re_try
    redirect_to root_path
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end