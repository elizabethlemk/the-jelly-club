class SpreadsController < ApplicationController
  before_action :set_spreads!, only: [:show, :edit, :update, :destroy]
  before_action :authorized

  def index
    @spreads = Spread.all
    @spread = Spread.new
  end

  def show
  end

  def new
    flash[:error] = []
    @spreads = Spread.all
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
    flash[:error] = []
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

  private

  def set_spreads!
    @spread = Spread.find(params[:id])
  end

  def spread_params
    params.require(:spread).permit(:name)
  end
end
