class MessagesController < ApplicationController

  # def index
  #   # @messages = @room..messages.includes(:user)
  #   @message = Message.new.includes(:user)
  #   @room = Room.find(params[:room_id])
  #   @messages = @room.messages.includes(:user)
  # end

  def new
  end

  def create
    binding.pry
    @room = Room.find(params[:room_id])
    @message = @room.messages.create!(message_params)
    ActionCable.server.broadcast 'room_channel', message: @message.content
  end

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
