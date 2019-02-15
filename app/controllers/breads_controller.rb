class BreadsController < ApplicationController
  before_action :set_breads!, only: [:show, :edit, :update, :destroy]
  before_action :reset_flash, only: [:index, :show, :new, :edit]
  before_action :set_index, only: [:index, :show, :new, :create]
  before_action :authorized

  def index
    @bread = Bread.new
  end

  def show
  end

  def new
    @bread = Bread.new
  end

  def create
    @bread = Bread.create(bread_params)
    if @bread.valid?
      redirect_to bread_path(@bread)
    else
      flash[:error] = @bread.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @bread.update(bread_params)
    if @bread.valid?
      redirect_to bread_path(@bread)
    else
      flash[:error] = @bread.errors.full_messages
      render :edit
    end
  end

  def destroy
    @bread.destroy
    redirect_to breads_path
  end


# Private helper methods
  private

  def set_breads!
    @bread = Bread.find(params[:id])
  end

  def set_index
    @breads = Bread.all
  end

  def reset_flash
    flash[:error] = []
  end

  def bread_params
    params.require(:bread).permit(:name)
  end
end
