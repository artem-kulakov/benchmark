class IndustriesController < ApplicationController
  before_action :set_industry, only: [:show, :edit, :update, :destroy]

  # GET /industries
  # GET /industries.json
  def index
    @industries = Industry.own(current_user.id)
    @foo = Industry.find_by_sql("SELECT *
      FROM industries
      GROUP BY initial_id
      HAVING MAX(user_id) = 2")
  end

  # GET /industries/1
  # GET /industries/1.json
  def show
  end

  # GET /industries/new
  def new
    @industry = Industry.new
  end

  # GET /industries/1/edit
  def edit
  end

  # POST /industries
  # POST /industries.json
  def create
    @industry = Industry.new(industry_params)

    respond_to do |format|
      if @industry.save
        
        # Copy industry id to initial_id column
        unless @industry.initial_id
          @industry.initial_id = @industry.id
          @industry.save
        end
        
        format.html { redirect_to industries_path, notice: 'Industry was successfully created.' }
        format.json { render action: 'show', status: :created, location: @industry }
        
      else
        format.html { render action: 'new' }
        format.json { render json: @industry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /industries/1
  # PATCH/PUT /industries/1.json
  def update
    respond_to do |format|
      if @industry.update(industry_params)
        format.html { redirect_to @industry, notice: 'Industry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @industry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /industries/1
  # DELETE /industries/1.json
  def destroy
    @industry.destroy
    respond_to do |format|
      format.html { redirect_to industries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_industry
      @industry = Industry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def industry_params
      params.require(:industry).permit(:title, :user_id, :initial_id)
    end
end
