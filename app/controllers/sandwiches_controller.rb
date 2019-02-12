class SandwichesController < ApplicationController
  before_action :set_sandwiches!, only: [:show, :edit, :update, :destroy]
  before_action :authorized

  def index
    @sandwiches = Sandwich.all
  end

  def show
    @feedback = @sandwich.user_feedbacks
    render :show
  end

  def new
    flash[:error] = []
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
    flash[:error] = []
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

  def sandwich_params
    params.require(:sandwich).permit(:name, :bread_id, :delicious, :user_id, :spread_ids => [])
  end
end
