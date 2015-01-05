@AppTree =
  Views:       {}
  Models:      {}
  Collections: {}
  Routers:     {}

$ ->
  AppTree.Routers.mainRouter = new AppTree.Routers.Main
  Backbone.history.start()

  genreList = new GenreCollection
  genreList.fetch
    success: (genres) ->
      genreListView = new GenreListView collection: genres

  appList = new AppCollection

  # Regular jQuery Stuff

  # Top Apps Page
  $appListHeader = $ '#app-list-container .header'
  $appListHeader.on 'click', 'span', (e) ->
    $spans = $(e.delegateTarget).find 'span'
    $spans.toggle()
