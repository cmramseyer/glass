App.activity = App.cable.subscriptions.create "ActivityChannel",
  connected: ->
    console.log("Channel Activity Up!");

  disconnected: ->
    console.log("Channel Activity Down!");

  received: (data) ->
    $('#tbody-activities').prepend(data['activity_tr']);
    $('#span-menu-activity').show(0).delay(12000).hide(0);