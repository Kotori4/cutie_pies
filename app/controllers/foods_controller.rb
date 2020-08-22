class FoodsController < ApplicationController

  def index
    @foods = Food.all.includes(:user).order("created_at DESC")
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to foods_path   
    else
      render 'new'
    end
  end

  def show
    @food = Food.find(params[:id])
  end

  private
  def food_params
    params.require(:food).permit(:food_image, :food_title, :food_text).merge(user_id: current_user.id)
  end
end