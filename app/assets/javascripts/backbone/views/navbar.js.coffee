class @NavbarView extends Backbone.View

  el: '#main-navbar'

  initialize: ->
    this.signedInTemplate = HandlebarsTemplates['layouts/signed_in_navbar']
    this.signedOutTemplate = HandlebarsTemplates['layouts/signed_out_navbar']

  events:
    'click #search-apps-button': 'searchApps'

  render: ->
    if this.model
      this.$el.html(this.signedInTemplate(this.model.toJSON()))
    else
      this.$el.html(this.signedOutTemplate())

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
