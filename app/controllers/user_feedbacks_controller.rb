class UserFeedbacksController < ApplicationController
  before_action :set_user_feedback!, only: [:edit, :update, :destroy]
  before_action :authorized

  def new
    flash[:error] = nil
    @user_feedback = UserFeedback.new
  end

  def create
    @user_feedback = UserFeedback.create(user_feedback_params)
    @sandwich = Sandwich.find(params["user_feedback"]["sandwich_id"])
    if @user_feedback.valid?
      redirect_to sandwich_path(@sandwich)
    else
# Flash error is not working. It doesn't show on the sandwich page
      flash.now[:error] = "Comment couldn't be created. Please check the errors."
      redirect_to sandwich_path(@sandwich)
    end
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
    flash[:error] = nil
  end

  def update
    @user = User.find(@user_feedback.user_id)
    @user_feedback.update(user_feedback_params)
    if @user_feedback.valid?
      redirect_to user_path(@user)
    else
      flash[:error] = @user_feedback.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user = User.find(@user_feedback.user_id)
    @user_feedback.destroy
    redirect_to user_path(@user)
  end

# Private helper methods
  private

  def set_user_feedback!
    @user_feedback = UserFeedback.find(params[:id])
  end

  def user_feedback_params
    params.require(:user_feedback).permit(:user_id, :sandwich_id, :rating, :comment, :favorite)
  end
end
