class CategoriesController < ApplicationController
  def show
    @posts = Post.where('category_id = ? ', params[:id]).order('created_at DESC').limit(5)
  end
end
