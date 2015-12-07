class FxRatesController < ApplicationController
  before_action :set_fx_rate, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @fx_rates = FxRate.all
    respond_with(@fx_rates)
  end

  def show
    respond_with(@fx_rate)
  end

  def new
    @fx_rate = FxRate.new
    respond_with(@fx_rate)
  end

  def edit
  end

  def create
    @fx_rate = FxRate.new(fx_rate_params)
    @fx_rate.save
    respond_with(@fx_rate)
  end

  def update
    @fx_rate.update(fx_rate_params)
    respond_with(@fx_rate)
  end

  def destroy
    @fx_rate.destroy
    respond_with(@fx_rate)
  end

  private
    def set_fx_rate
      @fx_rate = FxRate.find(params[:id])
    end

    def fx_rate_params
      params.require(:fx_rate).permit(:day_id, :currency_id, :rate)
    end
end
