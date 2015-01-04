var UserAuthView = Backbone.View.extend({
  el: '#modal-background .modal-dialog',
  initialize: function() {
    this.userAuthTemplate = HandlebarsTemplates['users/user_auth'];
  },

  events: {
  },

  render: function() {
    this.$el.append(this.userAuthTemplate());
  },

  signUp: function() {
    event.preventDefault();
  }
});
