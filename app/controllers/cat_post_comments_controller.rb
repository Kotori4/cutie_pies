class CatPostCommentsController < ApplicationController

  def create
    @cat_post_comment = current_user.cat_post_comments.build(cat_comment_params)
    if @cat_post_comment.save
      redirect_to "/cat_post/#{@cat_post_comment.cat_post.id}"
    end
  end

  private
  def cat_comment_params
    params.require(:cat_post).permit(:cat_post_comment).merge(cat_post_id: params[:cat_post_id])
  end
end
