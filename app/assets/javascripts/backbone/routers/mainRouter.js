AppTree.Routers.Main = Backbone.Router.extend({
  initialize: function() {
    AppTree.Models.currentUser = new AppTree.Models.CurrentUser();
    AppTree.Views.navBar = new AppTree.Views.Navbar({
      model: AppTree.Models.currentUser
    });
    AppTree.Views.userAuth = new AppTree.Views.UserAuth();
  }
});
