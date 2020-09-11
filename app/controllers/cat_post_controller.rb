class CatPostController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :all_posted, only: [:index, :posted]

  def index
  end

  def new
    @cat_post = CatPost.new
  end

  def create
    @cat_post = CatPost.new(cat_post_params)
    if @cat_post.save
      redirect_to cat_post_index_path   
    else
      render 'new'
    end
  end

  def show
    @cat_post = CatPost.find(params[:id])
    @cat_post_comment = CatPostComment.new
    @cat_post_comments = @cat_post.cat_post_comments.includes(:user).order("created_at DESC")
  end

  def posted
  end

private

def all_posted
  @cat_posts = CatPost.all.includes(:user).order("created_at DESC").page(params[:page]).per(24)
end

  def cat_post_params
    params.require(:cat_post).permit(:cat_image, :cat_post_title, :cat_post_text).merge(user_id: current_user.id)
  end
end
