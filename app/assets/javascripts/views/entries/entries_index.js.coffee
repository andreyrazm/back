class Back.Views.EntriesIndex extends Backbone.View
  template: JST['entries/index']

  events:
    'submit #new_entry': 'createEntry'
    'click #draw_winner': 'drawWinner'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendEntry)


  render: ->
    $(@el).html(@template())
    @collection.each(@appendEntry)
    this

  appendEntry: (entry) =>
    view = new Back.Views.Entry(model: entry)
    @$('#entry_list').append(view.render().el)

  createEntry: (event) ->
    event.preventDefault()
    attr = {name: $('#new_entry_name').val()}
    @collection.create attr,
      wait: true
      success: ->
        $('#new_entry_name').val('')
      error: @handleErrors

  handleErrors: (entry, response) ->
    errors = $.parseJSON(response.responseText).errors
    for attribute, messages of errors
      alert "#{attribute}, #{message}" for message in messages

  drawWinner: (event) ->
    event.preventDefault()
    @collection.drawWinner()