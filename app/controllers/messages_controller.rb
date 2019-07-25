class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = Message.new(message_params)
    if message.save
      ActionCable.server.broadcast "chatroom_channel", message: message
    else
      flash.now[:error] = "Message failed"
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :recipient_id, :sender_id)
  end
end