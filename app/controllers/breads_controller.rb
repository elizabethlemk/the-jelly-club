class BreadsController < ApplicationController
  before_action :set_breads!, only: [:show, :edit, :update, :destroy]
  before_action :authorized

  def index
    @bread = Bread.new
    @breads = Bread.all
  end

  def show
  end

  def new
    flash[:error] = []
    @breads = Bread.all
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
    flash[:error] = []
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

  private

  def set_breads!
    @bread = Bread.find(params[:id])
  end

  def bread_params
    params.require(:bread).permit(:name)
  end
end
