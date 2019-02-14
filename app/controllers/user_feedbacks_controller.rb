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

  def favorite
    @sandwich_id = params[:user_feedback][:sandwich_id]
    @favorite = UserFeedback.find_by(user_id: @current_user.id, sandwich_id: @sandwich_id)
    @favorite.update(favorite: params[:user_feedback][:favorite])
    redirect_to sandwich_path(@sandwich_id)
  end

  def favorite_destroy_all
    @current_user.user_feedbacks.each do |feedback|
      if feedback.comment == nil
        feedback.destroy
      end
    end
    redirect_to user_path(@current_user)
  end

  def comment_destroy_all
    @current_user.user_feedbacks.each do |feedback|
      if feedback.comment != nil
        feedback.destroy
      end
    end
    redirect_to user_path(@current_user)
  end

  def edit
  end

  def update
    @user = User.find(@user_feedback.user_id)
    @user_feedback.update(user_feedback_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(@user_feedback.user_id)
    @user_feedback.destroy
    redirect_to user_path(@user)
  end

  private

  def set_user_feedback!
    @user_feedback = UserFeedback.find(params[:id])
  end
  def user_feedback_params
    params.require(:user_feedback).permit(:user_id, :sandwich_id, :rating, :comment, :favorite)
  end
end
