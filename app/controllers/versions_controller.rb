class VersionsController < ApplicationController
  before_action :set_version, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @versions = Version.all
    respond_with(@versions)
  end

  def show
    respond_with(@version)
  end

  def new
    @version = Version.new
    respond_with(@version)
  end

  def edit
  end

  def create
    @version = Version.new(version_params)
    @version.save
    respond_with(@version)
  end

  def update
    @version.update(version_params)
    respond_with(@version)
  end

  def destroy
    @version.destroy
    respond_with(@version)
  end

  private
    def set_version
      @version = Version.find(params[:id])
    end

    def version_params
      params.require(:version).permit(:report_id, :user_id)
    end
end
