class FoodCommentsController < ApplicationController

  def create
    
    @food_comment = current_user.food_comment.build(food_comment_params)
    if @food_comment.save
      redirect_to "/food/#{@food_comment.food.id}"
    end
  end

  private
  def food_comment_params
    params.require(:food).permit(:food_comment).merge(food_id: params[:food_id])
  end
end
