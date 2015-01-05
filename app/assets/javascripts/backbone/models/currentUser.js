AppTree.Models.CurrentUser = Backbone.Model.extend({
  url: '/session',
  initialize: function() {
    console.log('User Signed In!');
    this.fetch();
  },

  isSignedIn: function() {
    var signedIn = this.get('id') ? true : false;
    return signedIn;
  },

  signOut: function() {
    this.fetch({ type: 'DELETE' });
    this.clear();
  }
});
