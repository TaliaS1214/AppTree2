class @GenreView extends Backbone.Marionette.ItemView

  tagName: 'li'

  template: (genreModel) ->
    HandlebarsTemplates['genres/single'](genreModel)

  events:
    "click": "loadApps"

  loadApps: (e) ->
    genreId = this.model.attributes.id
    $.ajax "/genres/#{genreId}",
      data:
        id: genreId
      success: (data) ->
        appList.reset(data.apps)

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
