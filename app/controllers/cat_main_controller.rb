class CatMainController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
  end
  def new
  end
  def create

  end

  private

  def image_params
    params.require(:cat_main).permit(:post_title, :post_text).merge(user_id: current_user.id)
  end
end
