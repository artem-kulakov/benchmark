class TopicsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  
  def index
    @topics = Topic.all # paginate(page: params[:page], per_page: 15)
#     respond_to do |format|
#       format.html
#       format.js
#     end
  end
  
  def show
    @posts = @topic.posts
  end

  def new
    @topic = Topic.new
  end

  def edit
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      flash[:success] = "Topic created!"
      redirect_to topics_url
    else
      render 'topics/index'
    end
  end

  def update
    if @topic.update_attributes(topic_params)
      flash[:success] = "Topic updated"
      redirect_to @topic
    else
      render 'edit'
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_url
  end

  private

    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title, :content)
    end
end
