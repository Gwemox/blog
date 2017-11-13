class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to post_path(@comment.post.id)
    end

  end

  protected
  def comment_params
    params
      .require(:comment)
      .permit(
        :email,
        :pseudo,
        :content,
        :post_id)
  end
end
