class MessagesController < ApplicationController
  
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(messages_params)
    @message.save
  end

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
  
end
