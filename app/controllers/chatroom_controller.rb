class ChatroomController < ApplicationController
  before_action :require_user

  def index
    @users = []
    chatroom_guests = current_user.sent.select(:recipient_id).distinct 
    chatroom_guests.each do |chatroom_guest|
      guest = User.find(chatroom_guest.recipient_id)
      @users.push(guest)
    end
  end

  def show
    @guest = User.find(params[:id])
    @message = Message.new
    @messages = Message.where(recipient_id: params[:id], sender_id: session[:user_id]).
                        or(Message.where(recipient_id: session[:user_id], sender_id: params[:id]))
  end
end
