class @AppTree.Views.Navbar extends Backbone.View
  el: '#main-navbar'

  initialize: ->
    console.log 'New Navbar View Created'
    @signedInTemplate = HandlebarsTemplates['layouts/signed_in_navbar']
    @signedOutTemplate = HandlebarsTemplates['layouts/signed_out_navbar']
    @listenTo @model, 'change', @render
    @render()

  events:
    'click #search-apps-button' : 'searchApps'
    'click #register-login-link': 'renderUserAuthModal'
    'click #logout-link': 'logOut'

  render: ->
    if @model.isSignedIn()
      @$el.html @signedInTemplate()
    else
      @$el.html @signedOutTemplate()

  renderUserAuthModal: ->
    event.preventDefault()

    AppTree.Views.userAuth.render()
    $('#modal-background').modal 'show'

  searchApps: ->
    event.preventDefault()
    searchTerm = @$el.find('input').val()

    $.get "/search", query: searchTerm, (data) ->
      console.log data

  logOut: ->
    @model.signOut()
