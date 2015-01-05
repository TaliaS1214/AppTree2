class @AppTree.Models.CurrentUser extends Backbone.Model
  url: '/session'
  initialize: ->
    console.log 'User Signed In!'
    this.fetch()

  isSignedIn: ->
    signedIn = @get('id') ? true : false
    signedIn

  signOut: ->
    this.fetch type: 'DELETE'
    this.clear()
