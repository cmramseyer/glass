App.notification = App.cable.subscriptions.create "NotificationChannel",
  connected: ->
    console.log("Channel Notification Up!");

  disconnected: ->
    console.log("Channel Notification Down!");

  received: (data) ->
    console.log("Channel Notification Receiving data: " + data['message']);
    $.notify(
      data['message'],
      {
        className: data['type'],
        autoHide: true,
        autoHideDelay: data['delay'],
        clickToHide: true
      }
    )