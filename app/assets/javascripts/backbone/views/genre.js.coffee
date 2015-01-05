class @GenreView extends Backbone.Marionette.ItemView

  tagName: 'li'

  template: (genreModel) ->
    HandlebarsTemplates['genres/single'](genreModel)

# class @GenreView extends Backbone.View
#
#   tagName: 'li'
#
#   initialize: ->
#     this.template = HandlebarsTemplates['genres/single'];
#     this.render()
#
#   render: ->
#     this.$el.html(this.template(this.model.toJSON()))
#     this
