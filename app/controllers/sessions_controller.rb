class SessionsController < ApplicationController
  def index
    flash[:error] = nil
    redirect_to "/login"
  end

  def new
    flash[:error] = nil
  end

  def create
    user = User.find_by(user_name: params[:user_name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = "INVALID LOGIN OR PASSWORD"
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to "/"
  end
end
