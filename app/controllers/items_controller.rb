class ItemsController < ApplicationController

  def index
    @items = Item.all.includes(:user).order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
    @item_comment = ItemComment.new
    @item_comments = @item.item_comments.includes(:user).order("created_at DESC")
  end

  private
  def item_params
    params.require(:item).permit(:item_image, :item_title, :item_text, :item_link).merge(user_id: current_user.id)
  end
end
