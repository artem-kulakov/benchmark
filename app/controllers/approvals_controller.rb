class ApprovalsController < ApplicationController
  before_action :set_approval, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @approvals = Approval.all
    respond_with(@approvals)
  end

  def show
    respond_with(@approval)
  end

  def new
    @approval = Approval.new
    respond_with(@approval)
  end

  def edit
  end

  def create
    @approval = Approval.new(approval_params)
    @approval.save
    respond_with(@approval)
  end

  def update
    @approval.update(approval_params)
    respond_with(@approval)
  end

  def destroy
    @approval.destroy
    respond_with(@approval)
  end

  private
    def set_approval
      @approval = Approval.find(params[:id])
    end

    def approval_params
      params.require(:approval).permit(:version_id, :user_id)
    end
end
