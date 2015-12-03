class AccountingStandardsController < ApplicationController
  before_action :set_accounting_standard, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @accounting_standards = AccountingStandard.all
    respond_with(@accounting_standards)
  end

  def show
    respond_with(@accounting_standard)
  end

  def new
    @accounting_standard = AccountingStandard.new
    respond_with(@accounting_standard)
  end

  def edit
  end

  def create
    @accounting_standard = AccountingStandard.new(accounting_standard_params)
    @accounting_standard.save
    respond_with(@accounting_standard)
  end

  def update
    @accounting_standard.update(accounting_standard_params)
    respond_with(@accounting_standard)
  end

  def destroy
    @accounting_standard.destroy
    respond_with(@accounting_standard)
  end

  private
    def set_accounting_standard
      @accounting_standard = AccountingStandard.find(params[:id])
    end

    def accounting_standard_params
      params.require(:accounting_standard).permit(:title)
    end
end
