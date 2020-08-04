class MessagesController < ApplicationController
  before_action :set_group
  
  def index 
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path
    else
      redirect_to group_messages_path
    end
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to group_messages_path
  end

private
  require 'open3'
  def message_params
    params.require(:message).permit(:text, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

end
