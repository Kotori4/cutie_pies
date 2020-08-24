class VetCommentsController < ApplicationController

  def create
    @vet_comment = current_user.vet_comments.build(vet_comment_params)
    if @vet_comment.save
      redirect_to vet_path(@vet_comment.vet_id)
    end
  end

  private
  def vet_comment_params
    params.require(:vet).permit(:vet_comment).merge(vet_id: params[:vet_id])
  end
end

