class CatPostCommentsController < ApplicationController

  def create
    @cat_post_comment = CatPostComment.create(cat_comment_params)
  if @cat_post_comment.save 
    redirect_to "/cat_main/#{cat_post_comment.cat_post.id}"
  end

  private
  def cat_comment_params
    params.require(:cat_post).permit(:cat_post_comment).merge(user_id: current_user.id, cat_post_id: params[:cat_post_id])
end
