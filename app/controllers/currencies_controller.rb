class CurrenciesController < ApplicationController
  before_action :set_currency, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @currencies = Currency.all
    respond_with(@currencies)
  end

  def show
    respond_with(@currency)
  end

  def new
    @currency = Currency.new
    respond_with(@currency)
  end

  def edit
  end

  def create
    @currency = Currency.new(currency_params)
    @currency.save
    respond_with(@currency)
  end

  def update
    @currency.update(currency_params)
    respond_with(@currency)
  end

  def destroy
    @currency.destroy
    respond_with(@currency)
  end

  private
    def set_currency
      @currency = Currency.find(params[:id])
    end

    def currency_params
      params.require(:currency).permit(:code, :title)
    end
end
