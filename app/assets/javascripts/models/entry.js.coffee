class Back.Models.Entry extends Backbone.Model

  win: ->
    @save 'winner': true
    @trigger('highlight')