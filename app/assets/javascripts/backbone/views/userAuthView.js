var UserAuthView = Backbone.View.extend({
  el: '#modal-background',
  initialize: function() {
    this.userAuthTemplate = HandlebarsTemplates['users/user_auth'];
  },

  events: {
  },

  render: function() {
  },

  signUp: function() {
    event.preventDefault();


  }
});
