class MessagesController < ApplicationController
  
  def new
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.create!(message_params)
    ActionCable.server.broadcast 'room_channel', message: @message.content
  end

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
