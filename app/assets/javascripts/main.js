AppTree = {
  Views:        {},
  Models:       {},
  Collections:  {},
  Routers:      {}
};


$(function(){
  AppTree.Routers.mainRouter = new AppTree.Routers.Main();
  Backbone.history.start();


  var genreList = new GenreCollection();
  var genreListView;
  genreList.fetch({
    success: function(genres) {
      genreListView = new GenreListView({ collection: genres })
    }
  });


  var appList = new AppCollection();
});
