var GenreView = Backbone.View.extend({
  initialize: function(){
    this.render();
  },
  render: function(){
    $listItem = $('<li>');
    $span = $('<span>').text(this.model.attributes.name);
    return $listItem.append($span);
  }
});
