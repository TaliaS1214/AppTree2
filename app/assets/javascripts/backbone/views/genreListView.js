var GenreListView = Backbone.View.extend({
  el: '#genre-list',

  initialize: function(){
    console.log('New Genre List View Created');
    this.render();
  },

  render: function(){
    this.collection.forEach(function(genreModel){
      var genreView = new GenreView({ model: genreModel });
      this.$el.append(genreView.render());
    }.bind(this));
  }
});
