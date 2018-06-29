class Api::V1::MessagesController < ActionController::Base
  before_action :set_channel
  def index
    messages = @channel.messages
    render json: messages
  end

  def create
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end
end
