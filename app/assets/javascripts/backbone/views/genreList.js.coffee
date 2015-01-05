class @GenreListView extends Backbone.Marionette.CollectionView

  el: '#genre-list'

  childView: GenreView

# class @GenreListView extends Backbone.View
#
#   el: '#genre-list'
#
#   initialize: ->
#     console.log 'New Genre List View Created'
#     this.renderAll()
#
#   renderAll: ->
#     this.collection.forEach (genreModel) =>
#       this.renderOne(genreModel)
#
#   renderOne: (genreModel) ->
#     genreView = new GenreView
#       model: genreModel
#     this.$el.append genreView.render().el
