class CatMainController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @cat_posts = CatPost.all.includes(:user).order("created_at DESC")
  end

  def new
    @cat_post = CatPost.new
  end

  def create
    @cat_post = CatPost.new(cat_post_params)
    if @cat_post.save
      redirect_to cat_main_index_path   
    else
      render 'new'
    end
  end

  def posted
    @cat_posts = CatPost.all.includes(:user).order("created_at DESC")
  end

private

  def cat_post_params
    params.require(:cat_post).permit(:cat_image, :post_title, :post_text).merge(user_id: current_user.id)
  end
end
