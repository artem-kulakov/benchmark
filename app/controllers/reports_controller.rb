class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /reports
  # GET /reports.json
  def index
    
    # Value.last.delete
    
    # Set industry id
    if params[:industry]
      if params[:industry] == "0"
        industry_id = 1
      else
        industry_id = params[:industry]
      end
    elsif session[:industry]
        if session[:industry] == "0"
          industry_id = 1
        else
          industry_id = session[:industry]
        end
    else
      industry_id = 7
    end
    
    session[:industry] = industry_id

    @industries = Industry.joins(:industry_titles).order(:title)
    @industry = Industry.find(industry_id)
    
    # Set period id
    if params[:period]
      period_id = params[:period]
    elsif session[:period]
      period_id = session[:period]
    else
      session[:period] = period_id = 1
    end
    
    session[:period] = period_id

    @periods = Period.order(:title)
    @period = Period.find(period_id)
    
    @reports = Report.joins(:company).where(companies: {industry_id: industry_id}, period_id: period_id)
    
    if industry_id == "2"
      @indicators = Indicator.where(industry_id: industry_id).order(:sequence)
    else
      @indicators = Indicator.where(industry_id: [industry_id, 0]).order(:sequence)
    end
    
    @indicators_titles = Hash[*Indicator.where(industry_id: [industry_id, 0]).collect {|it| [it.id.to_s, it.title]}.flatten]
    
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
    @companies = Company.where(industry_id: session[:industry]).order(:title)
    @periods = Period.order(:title)

    @report.values.new
    
    industry_id = session[:industry]
    
    if industry_id == "2"
      @indicators = Indicator.where(industry_id: industry_id)
    else
      @indicators = Indicator.where(industry_id: [industry_id, 0])
    end
    
    @industry = Industry.find(session[:industry])
    @period = Period.find(session[:period])
  end

  # GET /reports/1/edit
  def edit
    @companies = Company.order(:title)
    @periods = Period.order(:title)
    
    @industry = @report.industry
    industry_id = @industry.id

    if industry_id.to_s == 2.to_s
      @indicators = Indicator.where(industry_id: industry_id)
    else
      @indicators = Indicator.where(industry_id: [industry_id, 0])
    end
    
    @indicators.each do |indicator|
      if @report.values.where(indicator_id: indicator.id).empty?
        @report.values.new(indicator_id: indicator.id)
      end
    end
    
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
      params.require(:report).permit(:company_id, :period_id, values_attributes: [:id, :indicator_id, :value, :user_id])
    end
end
