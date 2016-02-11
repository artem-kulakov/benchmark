class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to topic_path(@post.topic)
    else
      render 'posts/index'
    end
  end

  def update
    if @post.update_attributes(post_params)
      flash[:success] = "Topic updated"
      redirect_to topic_path(@post.topic)
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to topic_path(@post.topic)
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content, :topic_id)
    end
end
