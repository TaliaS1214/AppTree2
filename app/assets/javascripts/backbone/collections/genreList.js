GenreCollection = Backbone.Collection.extend({
  initialize: function(){
    console.log('New Genre Collection Created');
  },
  url: '/genres'
});
