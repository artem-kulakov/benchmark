class GaapsController < ApplicationController
  before_action :set_gaap, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @gaaps = Gaap.all
    respond_with(@gaaps)
  end

  def show
    respond_with(@gaap)
  end

  def new
    @gaap = Gaap.new
    respond_with(@gaap)
  end

  def edit
  end

  def create
    @gaap = Gaap.new(gaap_params)
    @gaap.save
    respond_with(@gaap)
  end

  def update
    @gaap.update(gaap_params)
    respond_with(@gaap)
  end

  def destroy
    @gaap.destroy
    respond_with(@gaap)
  end

  private
    def set_gaap
      @gaap = Gaap.find(params[:id])
    end

    def gaap_params
      params.require(:gaap).permit(:title)
    end
end
