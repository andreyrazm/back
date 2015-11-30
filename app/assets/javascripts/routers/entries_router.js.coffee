class Back.Routers.Entries extends Backbone.Router
  routes:
    '': 'index'
    'entries/:id': 'show'

  initialize: ->
    @collection = new Back.Collections.Entries()
    @collection.reset($('#container').data('entries'))

  index: ->
    view = new Back.Views.EntriesIndex(collection: @collection)
    $('#container').html(view.render().el)

  show: (id) ->
    alert 'show  ' + id