class DogPostCommentsController < ApplicationController
  def create
    @dog_post_comment = current_user.dog_post_comments.build(dog_comment_params)
    if @dog_post_comment.save
      redirect_to "/dog_post/#{@dog_post_comment.dog_post.id}"
    end
  end

  private
  def dog_comment_params
    params.require(:dog_post).permit(:dog_post_comment).merge(dog_post_id: params[:dog_post_id])
  end
end
