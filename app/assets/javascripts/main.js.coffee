@AppTree =
  Views:       {}
  Models:      {}
  Collections: {}
  Routers:     {}

$ ->
  AppTree.Routers.mainRouter = new AppTree.Routers.Main
  Backbone.history.start()

  # Normal jQuery Stuff
  $appListHeader = $ "#app-list-container .header"
  $appListHeader.on "click", "a", (event) ->
    $header = $(event.delegateTarget)
    $tabs = $header.find("li").removeClass('active')
    $clickedTab = $(event.target)
    $clickedTab.parent().addClass('active')
    filter = $clickedTab.text()
    $('#top-apps-filter').text(filter)

  # Backbone Stuff
  window.navbarView = new NavbarView()

  ## Genre List
  window.genreList = new GenreCollection()
  window.genreListView = new GenreListView
    collection: genreList
  .render()

  ## App List
  window.appList = new AppCollection()
  window.appListView = new AppListView
    collection: appList
  .render()

  genreList.fetch
    success: (genres) ->
      genreList = genres

  appList.fetch
    success: (apps) ->
      appList = apps
