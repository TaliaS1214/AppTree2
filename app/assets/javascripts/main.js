$(function(){
  var navbarView = new NavbarView();

  var genreList = new GenreCollection();
  var genreListView;
  genreList.fetch({
    success: function(genres) {
      genreListView = new GenreListView({ collection: genres })
    }
  });


  var appList = new AppCollection();
});
