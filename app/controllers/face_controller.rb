class FaceController < ApplicationController
  def index
    @reports = Report.order(:company)
  end
end
