class SpreadsController < ApplicationController
  before_action :set_spreads!, only: [:show, :edit, :update, :destroy]
  before_action :set_index, only: [:index, :show, :new, :create]
  before_action :reset_flash, only: [:index, :show, :new, :edit]
  before_action :authorized

  def index
    @spread = Spread.new
  end

  def show
  end

  def new
    @spread = Spread.new
  end

  def create
    @spread = Spread.create(spread_params)
    if @spread.valid?
      redirect_to spread_path(@spread)
    else
      flash[:error] = @spread.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @spread.update(spread_params)
    if @spread.valid?
      redirect_to spread_path(@spread)
    else
      flash[:error] = @spread.errors.full_messages
      render :new
    end
  end


  def destroy
    @spread.destroy
    redirect_to spreads_path
  end

# Private helper methods
  private

  def set_spreads!
    @spread = Spread.find(params[:id])
  end

  def set_index
    @spreads = Spread.all
  end

  def reset_flash
    flash[:error] = []
  end

  def spread_params
    params.require(:spread).permit(:name)
  end
end
