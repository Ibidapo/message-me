App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    class_name =  if "#{window.location.href.split('/')[4]}" == "#{data.message.recipient_id}" then "my-message" else "your-message"

    $('.chatbox').append """
      <div class='#{class_name}'>
        <p>#{data.message.body}</p>
      </div>
    """
    scroll_bottom()
