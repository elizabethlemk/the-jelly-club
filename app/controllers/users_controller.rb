class UsersController < ApplicationController
  before_action :set_user!, only: [:show, :edit, :update, :destroy]
  before_action :authorized, except: [:new, :create]

  def show
    @current_user = User.find_by(id: session[:user_id])
    render :show
  end

  def new
    flash[:error] = []
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    flash[:error] = []
  end

  def update
    @user.update(user_params)
    if @user.valid?
      redirect_to edit_user_path
    else
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_name, :password, :password_confirmation)
  end

  def set_user!
    @user = User.find(params[:id])
  end
end
