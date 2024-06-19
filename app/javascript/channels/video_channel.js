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
    $("#list-video").prepend(data.layout)
    $.notify({
      title: data.noti_content,
    }, {
      style: 'foo',
      autoHide: false
    });
    // Called when there's incoming data on the websocket for this channel
  }
});
