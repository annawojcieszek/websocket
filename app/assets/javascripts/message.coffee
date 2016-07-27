class @Message

  messageTemplate: (message, channelName = 'broadcast') ->
    """
    <div>
      <span>
        <label>
          [#{channelName}]
        </label> #{message}
      </span>
    </div>
    """

  constructor: (@currentChannel = undefined) ->
    @dispatcher = new WebSocketRails(window.location.host + "/websocket")
    @bindEvents()

  bindEvents: ->
    @dispatcher.bind 'new_message', @receiveGlobalMessage
    $('#send_message').click @sendMessage


  receiveGlobalMessage: (message) =>
    $('#chat_history').append @messageTemplate(message.text)

  sendMessage: (e) =>
    e.preventDefault()
    message = $('textarea#new_message').val()
    @dispatcher.trigger 'new_message', text: message
    $('#new_message').val('')

$(document).ready ->
  window.Message = new Message