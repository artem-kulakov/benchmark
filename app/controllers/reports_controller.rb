class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :amend, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    
    # Set industry id
    if params[:industry]
      industry_id = params[:industry]
    elsif session[:industry]
      industry_id = session[:industry]
    else
      industry_id = 1
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
    
    
    # Set country
    if params[:country]
      @country = params[:country]
    elsif session[:country]
      @country = session[:country]
    else
      @country = 'RU'
    end
    
    session[:country] = @country
    
    
    # Set currency
    if params[:currency]
      @currency = params[:currency]
    elsif session[:currency]
      @currency = session[:currency]
    else
      @currency = 124
    end
    
    session[:currency] = @currency
    
    
    # List of currencies
    @currencies = list_of_currencies
    
    
    # Set reports and other
    if @country == ''
      # All countries
      @reports = Report.joins(:company).where(companies: {industry_id: industry_id}, period_id: period_id)
    else
      # Certain country
      @reports = Report.joins(:company).where(companies: {industry_id: industry_id, country: @country}, period_id: period_id)
    end
    
    @indicators = Indicator.where(industry_id: [industry_id, 0]).order(:sequence)
    
    @indicators_titles = Hash[*Indicator.where(industry_id: [industry_id, 0]).collect {|it| [it.id.to_s, it.title]}.flatten]
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    # Create new report and values
    @report = Report.new
    @report.values.new
    
    foo = Report.joins(:company).where(companies: {industry_id: 1}, period_id: 1).pluck(:company_id)
    @companies = Company.where(industry_id: session[:industry]).where.not(id: foo).order(:title)
    @periods = Period.order(:title)

    industry_id = session[:industry]
    
    @indicators = Indicator.where(industry_id: [industry_id, 0])
    
    @industry = Industry.find(session[:industry])
    @period = Period.find(session[:period])
    
    # List of currencies
    @currencies = list_of_currencies
    
    # Currency of the country chosen by the user in reports#index
    currency_code = ISO3166::Country.find_country_by_alpha2(params[:country]).currency['code']
    @currency_id = Currency.where(code: currency_code).pluck(:id)
  end

  # GET /reports/1/amend
  def amend
    # Create new version
    @new_version = @report.versions.new
    @new_values = @new_version.values.new
    
    @companies = Company.where(industry_id: session[:industry]).order(:title)
    @periods = Period.order(:title)

    industry_id = session[:industry]
    
    @indicators = Indicator.where(industry_id: [industry_id, 0]).order(:sequence)
    
    @industry = Industry.find(session[:industry])
    @period = Period.find(session[:period])
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
    
    # List of currencies
    available_currencies = FxRate.where(day_id: @period.day.id).pluck(:currency_id)
    @currencies = Currency.where(id: available_currencies).order(:title)
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
    if params[:parent_version_id]
      
      # New values
      val = []
    
      report_params['versions_attributes']['0']['values_attributes'].each do |i, v|
        val << v.values
      end
    
      new_values = Hash[val]
    
    
      # Old values
      i = @report.versions.find(params[:parent_version_id]).values.pluck(:indicator_id)
      v = @report.versions.find(params[:parent_version_id]).values.pluck(:value)
      old = Hash[i.zip v]
    
      # Differences between old and new values
      a = []
      old.each do |i, v|
        unless new_values["#{i}"] == nil or v == nil
          a << (new_values["#{i}"].to_f / v - 1).abs * 100
        end
      end

      deviation = a.sum.to_f / a.size
    
      if deviation <= 10
        penalty = deviation ** 2 / 10 ** 2
      else
        penalty = 0
      end
    
      # If report was checked before
      unless @report.versions.find(params[:parent_version_id]).checker.nil?
        
        reward = Version.find(params[:parent_version_id]).maker_reward
      
        # Deduct penalty from maker's rating
        maker = User.find(Version.find(params[:parent_version_id]).user_id)
        maker.rating -= reward * penalty
        maker.save
        
      else
        
        # Change maker's rating
        maker = User.find(Version.find(params[:parent_version_id]).user_id)
        maker_reward = (1000 - maker.rating) * 0.1 * params[:completeness].to_f
        maker.rating += maker_reward * (1 - penalty)
        maker.save
        
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

  # GET /reports/check
  def check
    # Change maker's rating
    maker = User.find(params[:user])
    maker_reward = (1000 - maker.rating) * 0.1 * params[:completeness].to_f
    maker.rating += maker_reward
    maker.save
    
    # Add checker's id, change rating to checker's rating
    version = Version.find(params[:version])
    version.checker = current_user.id
    version.rating = current_user.rating
    version.maker_reward = maker_reward
    version.save

    # Render index page
    respond_to do |format|
      format.html { redirect_to action: 'index', industry: session[:industry], period: session[:period] }
    end
  end

  def chart
    @woo = params[:woo]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:company_id, :period_id, :gaap_id, :rating, :maker_id, :maker_reward, :checker_id, values_attributes: [:id, :indicator_id, :value, :currency_id])
    end
    
    # List of currencies
    def list_of_currencies
      available_currencies = FxRate.where(day_id: @period.day.id).pluck(:currency_id)
      Currency.where(id: available_currencies).order(:code)
    end
end
