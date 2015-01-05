AppTree.Views.Navbar = Backbone.View.extend({
  el: '#main-navbar',

  initialize: function(){
    console.log('New Navbar View Created');
    this.signedInTemplate = HandlebarsTemplates['layouts/signed_in_navbar'];
    this.signedOutTemplate = HandlebarsTemplates['layouts/signed_out_navbar'];
    this.listenTo(this.model, 'change', this.render);
    this.render();
  },

  events: {
    'click #search-apps-button' : 'searchApps',
    'click #register-login-link': 'renderUserAuthModal',
    'click #logout-link': 'logOut'
  },

  render: function(){
    if (this.model.isSignedIn()) {
      this.$el.html(this.signedInTemplate());
    } else {
      this.$el.html(this.signedOutTemplate());
    }
  },

  renderUserAuthModal: function() {
    event.preventDefault();

    AppTree.Views.userAuth.render();
    $('#modal-background').modal('show');
  },

  searchApps: function(e){
    e.preventDefault();
    var searchTerm = this.$el.find('input').val();

    $.get("/search", { query: searchTerm }, function(data){
      console.log(data);
    });
  },

  logOut: function() {
    this.model.signOut();
  }

});
