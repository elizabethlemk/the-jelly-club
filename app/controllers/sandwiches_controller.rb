class SandwichesController < ApplicationController
  before_action :set_sandwiches!, only: [:show, :edit, :update, :destroy]
  before_action :set_index, only: [:index, :new, :create]
  before_action :reset_flash, only: [:index, :show, :new, :edit]
  before_action :authorized

  def index
    @sandwich = Sandwich.new
  end

  def show
    @feedback = @sandwich.user_feedbacks
    @user_feedback = UserFeedback.new
  end

  def new
    @sandwich = Sandwich.new
    @user = User.find(session[:user_id])
  end

  def create
    @sandwich = Sandwich.create(sandwich_params)
    if @sandwich.valid?
      redirect_to sandwich_path(@sandwich)
    else
      flash[:error] = @sandwich.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @sandwich.update(sandwich_params)
    if @sandwich.valid?
      redirect_to sandwich_path(@sandwich)
    else
      flash[:error] = @sandwich.errors.full_messages
      render :edit
    end
  end


  def destroy
    @sandwich.destroy
    redirect_to sandwiches_path
  end

  private

  def set_sandwiches!
    @sandwich = Sandwich.find(params[:id])
  end

  def set_index
    @sandwiches = Sandwich.all
  end

  def reset_flash
    flash[:error] = []
  end

  def sandwich_params
    params.require(:sandwich).permit(:name, :bread_id, :delicious, :user_id, :image, :spread_ids => [])
  end
end
