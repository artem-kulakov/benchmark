class IndicatorsController < ApplicationController
  before_action :set_indicator, only: [:show, :edit, :update, :destroy]

  # GET /indicators
  # GET /indicators.json
  def index
    if session[:industry].to_i == 2
      @indicators = Indicator.where(industry_id: session[:industry]).order(:sequence)
    else
      @indicators = Indicator.where(industry_id: [session[:industry], 0]).order(:sequence)
    end    
    
    @industry = Industry.find(session[:industry])
  end
  
  # GET /indicators/1
  # GET /indicators/1.json
  def show
  end

  # GET /indicators/new
  def new
    @indicator = Indicator.new
    @indicator.build_formula
    @indicators = Indicator.where(industry_id: session[:industry])
  end

  # GET /indicators/1/edit
  def edit
  end

  # POST /indicators
  # POST /indicators.json
  def create
    @indicator = Indicator.new(indicator_params)

    respond_to do |format|
      if @indicator.save
        format.html { redirect_to controller: 'reports', action: 'index', industry: @indicator.industry_id }
        format.json { render action: 'show', status: :created, location: @indicator }
      else
        format.html { render action: 'new' }
        format.json { render json: @indicator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /indicators/1
  # PATCH/PUT /indicators/1.json
  def update
    respond_to do |format|
      if @indicator.update(indicator_params)
        format.html { redirect_to @indicator, notice: 'Indicator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @indicator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indicators/1
  # DELETE /indicators/1.json
  def destroy
    @indicator.destroy
    respond_to do |format|
      format.html { redirect_to indicators_url }
      format.json { head :no_content }
    end
  end

  # GET /indicators/all/edit
  def edit_all
    if session[:industry].to_i == 2
      @indicators = Indicator.where(industry_id: session[:industry]).order(:sequence)
    else
      @indicators = Indicator.where(industry_id: [session[:industry], 0]).order(:sequence)
    end
    
    @industry = Industry.find(session[:industry])
  end

  # PUT /indicators/all
  def update_all
    Indicator.update(params['indicator'].keys, params['indicator'].values)
    redirect_to action: 'index', industry: session[:industry]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indicator
      @indicator = Indicator.find(session[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def indicator_params
      params.require(:indicator).permit(:title, :industry_id, :sequence, formula_attributes: [:id, :notation])
    end
end
