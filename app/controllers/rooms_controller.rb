class RoomsController < ApplicationController

  def index
    @rooms = Room.all.order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      render 'new' 
    end
  end

  def show
    @messages = Message.all.includes(:user).order(:id)
    @message = current_user.messages.build
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids:[])
  end
end