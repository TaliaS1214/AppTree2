class @GenreCollection extends Backbone.Collection

  initialize: ->
    console.log 'New Genre Collection Created'

  model: GenreModel

  url: '/genres'
