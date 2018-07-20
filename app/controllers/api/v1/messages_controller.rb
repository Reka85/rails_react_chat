class Api::V1::MessagesController < ActionController::Base
  before_action :set_channel
  def index
    messages = @channel.messages.order('created_at ASC')
    render json: messages
  end

  def create
    message = @channel.messages.build(content: params[:content])
    message.user = current_user
    message.save
    render json: message
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id)
  end

  def set_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end
end
