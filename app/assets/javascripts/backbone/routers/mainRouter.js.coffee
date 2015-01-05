class @AppTree.Routers.Main extends Backbone.Router
  initialize: ->

    # User Auth
    AppTree.Models.currentUser = new AppTree.Models.CurrentUser
    AppTree.Views.navBar = new AppTree.Views.Navbar
      model: AppTree.Models.currentUser

    AppTree.Views.userAuth = new AppTree.Views.UserAuth
