class DogPostController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :all_posted, only: [:index, :posted]

  def index
  end

  def new
    @dog_post = DogPost.new
  end

  def create
    @dog_post = DogPost.new(dog_post_params)
    if @dog_post.save
      redirect_to dog_post_index_path   
    else
      render 'new'
    end
  end

  def posted
  end

  private

  def all_posted
    @dog_posts = DogPost.all.includes(:user).order("created_at DESC").page(params[:page]).per(24)
  end
  
    def dog_post_params
      params.require(:dog_post).permit(:dog_image, :dog_post_title, :dog_post_text).merge(user_id: current_user.id)
    end
  end
  