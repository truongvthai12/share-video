import consumer from "channels/consumer"

consumer.subscriptions.create("VideoChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('connected')
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log('data is', data)
    $("#list-video").prepend(data.layout)
    $.notify(data.noti_content, { className: 'info'});
    // Called when there's incoming data on the websocket for this channel
  }
});
