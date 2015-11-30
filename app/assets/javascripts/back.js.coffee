window.Back =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Back.Routers.Entries()
    Backbone.history.start(pushState:true)


$(document).ready ->
  Back.initialize()
