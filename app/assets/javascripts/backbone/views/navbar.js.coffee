class @NavbarView extends Backbone.Marionette.ItemView

  el: '#main-navbar'

  events:
    'click #search-apps-button': 'searchApps'

  getTemplate: (userModel) ->
    if userModel
      HandlebarsTemplates['layouts/signed_in_navbar'](userModel)
    else
      HandlebarsTemplates['layouts/signed_out_navbar']

  searchApps: (e) ->
    e.preventDefault()
    searchTerm = this.$el.find('input').val()
    $.ajax
      url: "/search"
      type: "GET"
      data:
        query: searchTerm
      success: (data) ->
        console.log data

  # initialize: ->
  #   this.signedInTemplate = HandlebarsTemplates['layouts/signed_in_navbar']
  #   this.signedOutTemplate = HandlebarsTemplates['layouts/signed_out_navbar']

  # render: ->
  #   if this.model
  #     this.$el.html(this.signedInTemplate(this.model.toJSON()))
  #   else
  #     this.$el.html(this.signedOutTemplate())
