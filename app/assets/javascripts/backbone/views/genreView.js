var GenreView = Backbone.View.extend({
  initialize: function(){
    this.render();
  },
  render: function(){
    return $('<li>').text(this.model.attributes.name);
  }
});
