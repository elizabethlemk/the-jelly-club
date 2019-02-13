class UserFeedbacksController < ApplicationController
  before_action :set_user_feedback!, only: [:edit, :update, :destroy]
  before_action :authorized
  def new
    @user_feedback = UserFeedback.new
  end
  def create
    @user_feedback = UserFeedback.create(user_feedback_params)
    @sandwich = Sandwich.find(params["user_feedback"]["sandwich_id"])
    redirect_to sandwich_path(@sandwich)
  end
  def edit
  end
  def update
  end
  def destroy
  end

  private

  def set_user_feedback!
    @user_feedback = UserFeedback.find(params[:id])
  end
  def user_feedback_params
    params.require(:user_feedback).permit(:user_id, :sandwich_id, :comment, :rating, :favorite)
  end
end