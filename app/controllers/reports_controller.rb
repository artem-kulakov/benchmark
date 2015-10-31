class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :amend, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /reports
  # GET /reports.json
  def index
    
    # Report.delete_all
    # Version.delete_all
    # Value.delete_all
    
    # Approval.find(4).delete
    
    # @foo = Industry.find(8)
    # @foo.title = 'Retail'
    # @foo.save

    # @foo = User.find(3)
    # @foo.name = 'Good'
    # @foo.save
    
    # Set industry id
    if params[:industry]
      industry_id = params[:industry]
    elsif session[:industry]
      industry_id = session[:industry]
    else
      industry_id = 7
    end
    
    session[:industry] = industry_id

    @industries = Industry.order(:title)
    @industry = Industry.find(industry_id)
    
    # Set period id
    if params[:period]
      period_id = params[:period]
    elsif session[:period]
      period_id = session[:period]
    else
      period_id = 1
    end
    
    session[:period] = period_id

    @periods = Period.order(:title)
    @period = Period.find(period_id)
    
    @reports = Report.joins(:company).where(companies: {industry_id: industry_id}, period_id: period_id)
    
    @indicators = Indicator.where(industry_id: [industry_id, 0]).order(:sequence)
    
    @indicators_titles = Hash[*Indicator.where(industry_id: [industry_id, 0]).collect {|it| [it.id.to_s, it.title]}.flatten]
    
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
    version = @report.versions.new
    version.values.new
    
    @companies = Company.where(industry_id: session[:industry]).order(:title)
    @periods = Period.order(:title)

    industry_id = session[:industry]
    
    @indicators = Indicator.where(industry_id: [industry_id, 0])
    
    @industry = Industry.find(session[:industry])
    @period = Period.find(session[:period])
  end

  # GET /reports/1/amend
  def amend
    # Create new report version for amended values
    @new_version = @report.versions.new
    @new_values = @new_version.values.new
    
    
    @companies = Company.where(industry_id: session[:industry]).order(:title)
    @periods = Period.order(:title)

    industry_id = session[:industry]
    
    @indicators = Indicator.where(industry_id: [industry_id, 0]).order(:sequence)
    
    @industry = Industry.find(session[:industry])
    @period = Period.find(session[:period])
    
    # For maker's rating
    @i = @report.versions.find(@report.version_id).values.pluck(:indicator_id)
    @v = @report.versions.find(@report.version_id).values.pluck(:value)
    @old = Hash[@i.zip @v]
    flash[:maker] = @report.author_id
    flash[:old] = @old
    
    # Test data
    @new = {"1"=>"2400", "3"=>"", "2"=>"251", "4"=>"", "5"=>""}
  end

  # GET /reports/1/edit
  def edit
    @companies = Company.order(:title)
    @periods = Period.order(:title)
    
    @industry = @report.industry
    industry_id = @industry.id

    @indicators = Indicator.where(industry_id: [industry_id, 0])
    
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
    
    # If report was amended
    if flash[:maker]
      @user = User.find(flash[:maker])
      @user.rating += 10
      @user.save
      
      # New values
      a = []
      report_params['versions_attributes']['0']['values_attributes'].each do |k, v|
        a << v.values
      end
      flash[:hi] = Hash[a]
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

  # GET /reports/rate
  def rate
    # Change author's rate
    @user = User.find(params[:user])
    @user.rating += (1000 - @user.rating) * 0.1 * params[:completeness].to_f
    @user.save
    
    # Create new approval
    @approval = Approval.new
    @approval.version_id = params[:version]
    @approval.user_id = current_user.id
    @approval.save
    
    respond_to do |format|
      format.html { redirect_to action: 'index', industry: session[:industry], period: session[:period] }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:company_id, :period_id, versions_attributes: [:id, :user_id, values_attributes: [:id, :indicator_id, :value]])
    end
end
