class Back.Collections.Entries extends Backbone.Collection
  url: '/api/entries'
  model: Back.Models.Entry

  drawWinner: ->
    winner = @shuffle()[0]
    winner.win() if winner
