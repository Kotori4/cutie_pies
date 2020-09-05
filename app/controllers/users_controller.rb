class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @cat_posts = @user.cat_posts.includes(:user).order("created_at DESC")
    @items = @user.items.includes(:user).order("created_at DESC")
  end
end
