class IndustryIndicatorsController < ApplicationController
  before_action :set_industry_indicator, only: [:show, :edit, :update, :destroy]

  # GET /industry_indicators
  # GET /industry_indicators.json
  def index
    @industry_indicators = IndustryIndicator.all
  end

  # GET /industry_indicators/1
  # GET /industry_indicators/1.json
  def show
  end

  # GET /industry_indicators/new
  def new
    @industry_indicator = IndustryIndicator.new
  end

  # GET /industry_indicators/1/edit
  def edit
  end

  # POST /industry_indicators
  # POST /industry_indicators.json
  def create
    @industry_indicator = IndustryIndicator.new(industry_indicator_params)

    respond_to do |format|
      if @industry_indicator.save
        format.html { redirect_to @industry_indicator, notice: 'Industry indicator was successfully created.' }
        format.json { render action: 'show', status: :created, location: @industry_indicator }
      else
        format.html { render action: 'new' }
        format.json { render json: @industry_indicator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /industry_indicators/1
  # PATCH/PUT /industry_indicators/1.json
  def update
    respond_to do |format|
      if @industry_indicator.update(industry_indicator_params)
        format.html { redirect_to @industry_indicator, notice: 'Industry indicator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @industry_indicator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /industry_indicators/1
  # DELETE /industry_indicators/1.json
  def destroy
    @industry_indicator.destroy
    respond_to do |format|
      format.html { redirect_to industry_indicators_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_industry_indicator
      @industry_indicator = IndustryIndicator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def industry_indicator_params
      params.require(:industry_indicator).permit(:industry_id, :indicator_id)
    end
end
