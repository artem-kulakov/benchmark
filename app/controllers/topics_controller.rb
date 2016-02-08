class TopicsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
  
  def index
    @topics = Topic.paginate(page: params[:page], per_page: 15)
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      flash[:success] = "Topic created!"
      redirect_to root_url
    else
      render 'reports/index'
    end
  end

  def destroy
  end

  private

    def topic_params
      params.require(:topic).permit(:title, :content)
    end
end
