WebsocketRails::EventMap.describe do
  subscribe :new_message, to: Websocket::MessagesController, with_method: :incoming_message
end
