class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    
    # Set industry id
    if params[:industry]
      industry_id = params[:industry]
    else
      industry_id = 1
    end
    
    @industries = Industry.order(:title)
    @industry = Industry.find(industry_id)
    
    # Set period id
    if params[:period]
      period_id = params[:period]
    else
      period_id = 1
    end
    
    @periods = Period.order(:title)
    @period = Period.find(period_id)
    
    @reports = Report.joins(:company).where(companies: {industry_id: industry_id}, period_id: period_id)
    @indicators = Industry.find(industry_id).indicators
    
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
    @companies = Company.where(industry_id: params[:industry]).order(:title)
    @periods = Period.order(:title)

    @report.values.new
    @indicators = Industry.find(params[:industry]).indicators
    
    @industry = Industry.find(params[:industry])
    @period = Period.find(params[:period])
  end

  # GET /reports/1/edit
  def edit
    @companies = Company.order(:title)
    @periods = Period.order(:title)
    @indicators = @report.indicators
    @industry = @report.industry
    @period = @report.period
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to action: 'index', industry: @report.industry.id, period: @report.period.id }
        format.json { render action: 'show', status: :created, location: @report }
      else
        format.html { render action: 'new' }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to action: 'index', industry: @report.industry.id, period: @report.period.id }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:company_id, :period_id, values_attributes: [:id, :indicator_id, :value])
    end
end
