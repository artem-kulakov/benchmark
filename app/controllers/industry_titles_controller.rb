class IndustryTitlesController < ApplicationController
  before_action :set_industry_title, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @industry_titles = IndustryTitle.all
    respond_with(@industry_titles)
  end

  def show
    respond_with(@industry_title)
  end

  def new
    @industry_title = IndustryTitle.new
    respond_with(@industry_title)
  end

  def edit
  end

  def create
    @industry_title = IndustryTitle.new(industry_title_params)
    @industry_title.save
    respond_with(@industry_title)
  end

  def update
    @industry_title.update(industry_title_params)
    respond_with(@industry_title)
  end

  def destroy
    @industry_title.destroy
    respond_with(@industry_title)
  end

  private
    def set_industry_title
      @industry_title = IndustryTitle.find(params[:id])
    end

    def industry_title_params
      params.require(:industry_title).permit(:title, :industry_id, :user_id)
    end
end
