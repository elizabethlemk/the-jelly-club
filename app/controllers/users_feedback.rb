class UsersFeedback < ApplicationController
  before_action :set_user_feedback!, only: [:show, :edit, :update, :destroy]
  before_action :authorized
  def new
  end
  def create
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
end
