class TopicsController < ApplicationController
  def index
    @topics = Topic.paginate(page: params[:page], per_page: 15)
    respond_to do |format|
      format.html
      format.js
    end
  end
end
