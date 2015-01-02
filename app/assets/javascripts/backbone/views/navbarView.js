var NavbarView = Backbone.View.extend({
  el: '#main-navbar',

  initialize: function(){
    this.signedInTemplate = HandlebarsTemplates['layouts/signed_in_navbar'];
    this.signedOutTemplate = HandlebarsTemplates['layouts/signed_out_navbar'];
  },

  events: {
    'click #search-apps-button' : 'searchApps'
  },

  render: function(){
    if (this.model) {
      this.$el.html(this.signedInTemplate(this.model.toJSON()));
    } else {
      this.$el.html(this.signedOutTemplate());
    }
  },

  searchApps: function(e){
    e.preventDefault();
    var searchTerm = this.$el.find('input').val();

    $.get("/search", { query: searchTerm }, function(data){
      console.log(data);
    });
  }

});
