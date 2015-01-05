$ ->
  # Normal jQuery Stuff
  $appListHeader = $ "#app-list-container .header"
  $appListHeader.on "click", "span", (event) ->
    $spans = $(event.delegateTarget).find ".top-apps-button"
    weekOrMonth = $spans.filter(":visible").text().split(" ").pop()
    $('#week-or-month').text(weekOrMonth)
    $spans.toggle()

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
