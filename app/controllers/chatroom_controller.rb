class ChatroomController < ApplicationController
  before_action :require_user

  def index
    @message = Message.new
    @messages = Message.all
  end

  def show
    @message = Message.new
    @messages = Message.where(recipient_id: params[:id], sender_id: session[:user_id]).
                        or(Message.where(recipient_id: session[:user_id], sender_id: params[:id]))
  end
end
