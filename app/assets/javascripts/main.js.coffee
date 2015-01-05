$ ->
  # Normal jQuery Stuff
  $appListHeader = $ "#app-list-container .header"
  $appListHeader.on "click", "span", (event) ->
    $spans = $(event.delegateTarget).find ".top-apps-button"
    $spans.toggle()

  # Backbone Stuff
  navbarView = new NavbarView()
  genreList = new GenreCollection()
  appList = new AppCollection()

  genreList.fetch
    success: (genres) ->
      genreListView = new GenreListView
        collection: genres
      genreListView.render()

  appList.fetch
    success: (apps) ->
        appListView = new AppListView
          collection: apps
        appListView.render()
