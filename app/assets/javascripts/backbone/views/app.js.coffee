class @AppView extends Backbone.Marionette.ItemView

  tagName: 'li'

  template: (appModel) ->
    HandlebarsTemplates['apps/small_view'] (appModel)
