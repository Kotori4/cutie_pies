class ItemCommentsController < ApplicationController

  def create
    @item_comment = current_user.item_comments.build(item_comment_params)
    if @item_comment.save
      redirect_to item_path(@item_comment.item_id)
    end
  end

  private
  def item_comment_params
    params.require(:item).permit(:item_comment).merge(item_id: params[:item_id])
  end
end

