class FoodCommentsController < ApplicationController

  def create
    @food_comment = current_user.food_comments.build(food_comment_params)
    if @food_comment.save
      redirect_to food_path(@food_comment.food_id)
    end
  end

  private
  def food_comment_params
    params.require(:food).permit(:food_comment).merge(food_id: params[:food_id])
  end
end
