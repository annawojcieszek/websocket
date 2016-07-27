class Websocket::MessagesController < WebsocketRails::BaseController

  def incoming_message
    @message = Message.new(body: message[:text])
    if @message.save
      broadcast_message :new_message, {text: message[:text]}
    end
  end

end