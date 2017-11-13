class PostsController < ApplicationController
  before_action :redirect_no_admin, only: [:create]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    end
  end

  protected
  def post_params
    params
      .require(:post)
      .permit(
        :title,
        :content)
      .merge(user_id: current_user.id)
  end
end
